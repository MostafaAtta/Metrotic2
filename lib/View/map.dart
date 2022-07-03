import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test/helper.dart';

import '../mapHelper.dart';

class MapLocation extends StatefulWidget {
  final int? GetLocation;
  final int? GetNearStation;

  const MapLocation({Key? key, this.GetLocation, this.GetNearStation})
      : super(key: key);

  @override
  _MapLocationState createState() => _MapLocationState();
}

class _MapLocationState extends State<MapLocation> {
  CameraPosition _initialLocation =
      CameraPosition(target: LatLng(30.033333, 31.233334), zoom: 8);
  late GoogleMapController mapController;

  late Position _currentPosition;
  String _currentAddress = '';

  final startAddressController = TextEditingController();
  final destinationAddressController = TextEditingController();

  final startAddressFocusNode = FocusNode();
  final desrinationAddressFocusNode = FocusNode();

  String _startAddress = '';
  String _destinationAddress = '';
  String? _placeDistance;

  Set<Marker> markers = {};

  late PolylinePoints polylinePoints;
  final Set<Polyline> _polyline = {};

  Map<PolylineId, Polyline> polylines = {};

  List<LatLng> polylineCoordinates = [];

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _getCurrentLocation();

    super.initState();
  }

  Widget _textField({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String label,
    required String hint,
    required double width,
    required Icon prefixIcon,
    Widget? suffixIcon,
    required Function(String) locationCallback,
  }) {
    return Container(
      width: width * 0.8,
      child: TextField(
        onChanged: (value) {
          locationCallback(value);
        },
        controller: controller,
        focusNode: focusNode,
        decoration: new InputDecoration(
          labelStyle: TextStyle(color: ColorsHelp.background),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(
              color: ColorsHelp.background,
              width: 2,
            ),
          ),
          contentPadding: EdgeInsets.all(15),
          hintText: hint,
        ),
      ),
    );
  }

  // Method for retrieving the current location
  _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      setState(() {
        _currentPosition = position;
        print('CURRENT POS: $_currentPosition');
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );
      });
      await _getAddress();
    }).catchError((e) {
      print(e);
    });
  }

  // Method for retrieving the address
  _getAddress() async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
        startAddressController.text = _currentAddress;
        _startAddress = _currentAddress;
      });
    } catch (e) {
      print(e);
    }
  }

  // Method for calculating the distance between two places
  Future<bool> _calculateDistance() async {
    try {
      // Retrieving placemarks from addresses
      List<Location> startPlacemark = await locationFromAddress(_startAddress);
      List<Location> destinationPlacemark =
          await locationFromAddress(_destinationAddress);

      double startLatitude = _startAddress == _currentAddress
          ? _currentPosition.latitude
          : startPlacemark[0].latitude;

      double startLongitude = _startAddress == _currentAddress
          ? _currentPosition.longitude
          : startPlacemark[0].longitude;

      double destinationLatitude = destinationPlacemark[0].latitude;
      double destinationLongitude = destinationPlacemark[0].longitude;

      String startCoordinatesString = '($startLatitude, $startLongitude)';
      String destinationCoordinatesString =
          '($destinationLatitude, $destinationLongitude)';

      // Start Location Marker
      Marker startMarker = Marker(
        markerId: MarkerId(startCoordinatesString),
        position: LatLng(startLatitude, startLongitude),
        infoWindow: InfoWindow(
          title: 'Start $startCoordinatesString',
          snippet: _startAddress,
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      // Destination Location Marker
      Marker destinationMarker = Marker(
        markerId: MarkerId(destinationCoordinatesString),
        position: LatLng(destinationLatitude, destinationLongitude),
        infoWindow: InfoWindow(
          title: 'Destination $destinationCoordinatesString',
          snippet: _destinationAddress,
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      // Adding the markers to the list
      markers.add(startMarker);
      markers.add(destinationMarker);

      print(
        'START COORDINATES: ($startLatitude, $startLongitude)',
      );
      print(
        'DESTINATION COORDINATES: ($destinationLatitude, $destinationLongitude)',
      );

      // Calculating to check that the position relative
      // to the frame, and pan & zoom the camera accordingly.
      double miny = (startLatitude <= destinationLatitude)
          ? startLatitude
          : destinationLatitude;
      double minx = (startLongitude <= destinationLongitude)
          ? startLongitude
          : destinationLongitude;
      double maxy = (startLatitude <= destinationLatitude)
          ? destinationLatitude
          : startLatitude;
      double maxx = (startLongitude <= destinationLongitude)
          ? destinationLongitude
          : startLongitude;

      double southWestLatitude = miny;
      double southWestLongitude = minx;

      double northEastLatitude = maxy;
      double northEastLongitude = maxx;

      // Accommodate the two locations within the
      // camera view of the map
      mapController.animateCamera(
        CameraUpdate.newLatLngBounds(
          LatLngBounds(
            northeast: LatLng(northEastLatitude, northEastLongitude),
            southwest: LatLng(southWestLatitude, southWestLongitude),
          ),
          100.0,
        ),
      );

      // Calculating the distance between the start and the end positions
      // with a straight path, without considering any route
      double distanceInMeters = await Geolocator.bearingBetween(
        startLatitude,
        startLongitude,
        destinationLatitude,
        destinationLongitude,
      );

      await _createPolylines(startLatitude, startLongitude, destinationLatitude,
          destinationLongitude);

      double totalDistance = 0.0;

      // Calculating the total distance by adding the distance
      // between small segments
      for (int i = 0; i < polylineCoordinates.length - 1; i++) {
        totalDistance += _coordinateDistance(
          polylineCoordinates[i].latitude,
          polylineCoordinates[i].longitude,
          polylineCoordinates[i + 1].latitude,
          polylineCoordinates[i + 1].longitude,
        );
      }

      setState(() async {
        distanceInMeters;
        await _createPolylines(startLatitude, startLongitude,
            destinationLatitude, destinationLongitude);
        _placeDistance = totalDistance.toStringAsFixed(2);
        print('DISTANCE: $_placeDistance km');
      });

      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }

  List<Destination> destinationlist = [];

  NearestStation() {
    var A = _coordinateDistance(_currentPosition.latitude,
        _currentPosition.longitude, 30.12411, 31.24358);
    var B = _coordinateDistance(_currentPosition.latitude,
        _currentPosition.longitude, 30.1139678256, 31.2492867704);
    var C = _coordinateDistance(_currentPosition.latitude,
        _currentPosition.longitude, 30.10408, 31.24562);
    var D = _coordinateDistance(_currentPosition.latitude,
        _currentPosition.longitude, 30.0999764249, 31.2462914808);
    var E = _coordinateDistance(_currentPosition.latitude,
        _currentPosition.longitude, 30.0879592, 31.2455034);

    if (A < B && A < C && A < D && A < E) {
      Marker startMarker = Marker(
        markerId: MarkerId("2"),
        position: LatLng(30.12411, 31.24358),
        infoWindow: InfoWindow(
          title: "To",
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      // Destination Location Marker
      Marker destinationMarker = Marker(
        markerId: MarkerId("1"),
        position: LatLng(_currentPosition.latitude, _currentPosition.longitude),
        infoWindow: InfoWindow(
          title: 'From',
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      setState(() {
        markers.add(startMarker);
        markers.add(destinationMarker);

        _polyline.add(Polyline(
            polylineId: PolylineId("1"),
            visible: true,
            points: [
              LatLng(_currentPosition.latitude, _currentPosition.longitude),
              LatLng(30.12411, 31.24358),
            ],
            color: Colors.blue,
            width: 3));
      });
    } else if (B < A && B < C && B < D && B < E) {
      Marker startMarker = Marker(
        markerId: MarkerId("2"),
        position: LatLng(30.1139678256, 31.2492867704),
        infoWindow: InfoWindow(
          title: "To",
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      // Destination Location Marker
      Marker destinationMarker = Marker(
        markerId: MarkerId("1"),
        position: LatLng(_currentPosition.latitude, _currentPosition.longitude),
        infoWindow: InfoWindow(
          title: 'From',
        ),
        icon: BitmapDescriptor.defaultMarker,
      );
      setState(() {
        markers.add(startMarker);
        markers.add(destinationMarker);
      });
    } else if (C < A && C < B && C < D && C < E) {
      Marker startMarker = Marker(
        markerId: MarkerId("2"),
        position: LatLng(30.10408, 31.24562),
        infoWindow: InfoWindow(
          title: "To",
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      // Destination Location Marker
      Marker destinationMarker = Marker(
        markerId: MarkerId("1"),
        position: LatLng(_currentPosition.latitude, _currentPosition.longitude),
        infoWindow: InfoWindow(
          title: 'From',
        ),
        icon: BitmapDescriptor.defaultMarker,
      );
      setState(() {
        markers.add(startMarker);
        markers.add(destinationMarker);
      });
    } else if (D < A && D < B && D < C && D < E) {
      Marker startMarker = Marker(
        markerId: MarkerId("2"),
        position: LatLng(30.0999764249, 31.2462914808),
        infoWindow: InfoWindow(
          title: "To",
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      // Destination Location Marker
      Marker destinationMarker = Marker(
        markerId: MarkerId("1"),
        position: LatLng(_currentPosition.latitude, _currentPosition.longitude),
        infoWindow: InfoWindow(
          title: 'From',
        ),
        icon: BitmapDescriptor.defaultMarker,
      );
      setState(() {
        markers.add(startMarker);
        markers.add(destinationMarker);
      });
    } else {
      Marker startMarker = Marker(
        markerId: MarkerId("2"),
        position: LatLng(30.0879592, 31.2455034),
        infoWindow: InfoWindow(
          title: "To",
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      // Destination Location Marker
      Marker destinationMarker = Marker(
        markerId: MarkerId("1"),
        position: LatLng(_currentPosition.latitude, _currentPosition.longitude),
        infoWindow: InfoWindow(
          title: 'From',
        ),
        icon: BitmapDescriptor.defaultMarker,
      );
      setState(() {
        markers.add(startMarker);
        markers.add(destinationMarker);
      });
    }
  }

  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  // Create the polylines for showing the route between two places
  _createPolylines(
    double startLatitude,
    double startLongitude,
    double destinationLatitude,
    double destinationLongitude,
  ) async {
    polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyAWdsVZ10-lbtg_6-d2weqxOSHRZ9h4y-Q", // Google Maps API Key
      PointLatLng(startLatitude, startLongitude),
      PointLatLng(destinationLatitude, destinationLongitude),
      travelMode: TravelMode.transit,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.blue,
      points: polylineCoordinates,
      width: 4,
    );
    polylines[id] = polyline;
  }

  @override
  Widget build(BuildContext context) {
    InkWell loc = InkWell(
      splashColor: Colors.orange, // inkwell color
      child: SizedBox(
        width: 56,
        height: 56,
        child: Icon(
          Icons.my_location,
          color: ColorsHelp.background,
        ),
      ),
      onTap: () {
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(
                _currentPosition.latitude,
                _currentPosition.longitude,
              ),
              zoom: 18.0,
            ),
          ),
        );
      },
    );
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      child: Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: <Widget>[
            // Map View
            GoogleMap(
              markers: Set<Marker>.from(markers),
              initialCameraPosition: _initialLocation,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              polylines: _polyline,
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
                if (widget.GetNearStation == 2) {
                  setState(() {
                    NearestStation();
                  });
                }
                if (widget.GetLocation == 1) {
                  mapController.animateCamera(
                    CameraUpdate.newCameraPosition(
                      CameraPosition(
                        target: LatLng(
                          _currentPosition.latitude,
                          _currentPosition.longitude,
                        ),
                        zoom: 15.0,
                      ),
                    ),
                  );
                }
              },
            ),
            // Show zoom buttons
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipOval(
                      child: Material(
                        color: ColorsHelp.background, // button color
                        child: InkWell(
                          splashColor: ColorsHelp.backgroundG, // inkwell color
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(
                              Icons.add,
                              color: ColorsHelp.backgroundG,
                            ),
                          ),
                          onTap: () {
                            mapController.animateCamera(
                              CameraUpdate.zoomIn(),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ClipOval(
                      child: Material(
                        color: ColorsHelp.background, // button color
                        child: InkWell(
                          splashColor: ColorsHelp.backgroundG, // inkwell color
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Icon(
                              Icons.remove,
                              color: ColorsHelp.backgroundG,
                            ),
                          ),
                          onTap: () {
                            mapController.animateCamera(
                              CameraUpdate.zoomOut(),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Show the place input fields & button for
            // showing the route
            SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    width: width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Stations',
                            style: TextStyle(fontSize: 20.0),
                          ),
                          SizedBox(height: 10),
                          _textField(
                              label: 'Start',
                              hint: 'Choose starting point',
                              prefixIcon: Icon(
                                Icons.looks_one,
                                color: ColorsHelp.backgroundG,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.my_location,
                                  color: ColorsHelp.background,
                                ),
                                onPressed: () {
                                  setState(() {
                                    startAddressController.text =
                                        _currentAddress;
                                    _startAddress = _currentAddress;
                                  });
                                },
                              ),
                              controller: startAddressController,
                              focusNode: startAddressFocusNode,
                              width: width,
                              locationCallback: (String value) {
                                setState(() {
                                  _startAddress = value;
                                });
                              }),
                          SizedBox(height: 10),
                          _textField(
                              label: 'Destination',
                              hint: 'Choose destination',
                              prefixIcon: Icon(
                                Icons.looks_two,
                                color: ColorsHelp.backgroundG,
                              ),
                              controller: destinationAddressController,
                              focusNode: desrinationAddressFocusNode,
                              width: width,
                              locationCallback: (String value) {
                                setState(() {
                                  _destinationAddress = value;
                                });
                              }),
                          SizedBox(height: 10),
                          Visibility(
                            visible: _placeDistance == null ? false : true,
                            child: Text(
                              'DISTANCE: $_placeDistance km',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          ElevatedButton(
                            onPressed: (_startAddress != '' &&
                                    _destinationAddress != '')
                                ? () async {
                                    startAddressFocusNode.unfocus();
                                    desrinationAddressFocusNode.unfocus();
                                    setState(() {
                                      if (markers.isNotEmpty) markers.clear();
                                      if (polylines.isNotEmpty)
                                        polylines.clear();
                                      if (polylineCoordinates.isNotEmpty)
                                        polylineCoordinates.clear();
                                      _placeDistance = null;
                                    });

                                    _calculateDistance().then((isCalculated) {
                                      if (isCalculated) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Distance Calculated Sucessfully'),
                                          ),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'Error Calculating Distance'),
                                          ),
                                        );
                                      }
                                    });
                                  }
                                : null,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Show Route'.toUpperCase(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: ColorsHelp.background,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Show current location button
            SafeArea(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 5, bottom: 80.0),
                  child: ClipOval(
                    child: Material(
                        color: Colors.orange.shade100, // button color
                        child: loc),
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Align(
                alignment: Alignment(1, 0.1),
                child: Padding(
                  padding: const EdgeInsets.only(right: 2, bottom: 10, top: 10),
                  child: InkWell(
                    splashColor: Colors.orange, // inkwell color
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: ColorsHelp.background,
                        size: 30,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: SlidingUpPanelWidget(
            //     panelController: panelController,
            //     onTap: () {
            //       if (SlidingUpPanelStatus.expanded == panelController.status) {
            //         panelController.collapse();
            //       } else {
            //         panelController.expand();
            //       }
            //     },
            //     enableOnTap: true, //Enable the onTap callback for control bar.
            //     anchor: 0.3,
            //
            //     controlHeight: 30,
            //     child: Container(
            //     decoration: ShapeDecoration(
            //       color: Colors.white,
            //       shadows: [
            //         BoxShadow(
            //             blurRadius: 5.0,
            //             spreadRadius: 2.0,
            //             color: const Color(0x11000000))
            //       ],
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(10.0),
            //           topRight: Radius.circular(10.0),
            //         ),
            //       ),
            //     ),
            //     child: Column(
            //       children: <Widget>[
            //         Container(
            //           width: 200,
            //           alignment: Alignment.center,
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: <Widget>[
            //               Icon(
            //                 Icons.keyboard_arrow_up_sharp,
            //                 size: 30,
            //               ),
            //
            //             ],
            //           ),
            //         ),
            //         Divider(
            //           height: 0.5,
            //           color: Colors.grey[300],
            //         ),
            //
            //       ],
            //       mainAxisSize: MainAxisSize.min,
            //     ),
            //   ),
            //     dragDown: (details) {
            //       print('dragDown');
            //     },
            //     dragStart: (details) {
            //       print('dragStart');
            //     },
            //     dragCancel: () {
            //       print('dragCancel');
            //     },
            //     dragUpdate: (details) {
            //       print(
            //           'dragUpdate,${panelController.status == SlidingUpPanelStatus.dragging ? 'dragging' : ''}');
            //     },
            //     dragEnd: (details) {
            //       print('dragEnd');
            //     },
            //   ),
            // ))
          ],
        ),
      ),
    );
  }
}
