import 'dart:developer';
import 'dart:typed_data';
import 'package:easy_localization/easy_localization.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:test/View/map.dart';
import '../firebase_auth.dart';
import '../helper.dart';
import '../widget/Person.dart';
import '../widget/botom Bar.dart';
import '../widget/hello.dart';
import '../widget/line Station.dart';
import 'menu.dart';
import 'dart:ui' as ui;

class Home extends StatefulWidget {
  static const routeName = "/home_screen";

  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  String uid = "";
  String email = "";
  String name = "";
  String phone = "";
  String tagID = "";
  String nationalID = "";

  String fromStation = "";
  String toStation = "";

  int fromStationID = 0;
  int toStationID = 0;
  int noOfStations = 0;

  PanelController _pc = new PanelController();
  late GoogleMapController mapController;
  late PolylinePoints polylinePoints;
  LatLng center = LatLng(30.044420, 31.235712);
  Set<Marker> markers = {};
  Set<Polyline> polyline = {};
  List<LatLng> polylineCoordinates = [];
  MapType type = MapType.normal;
  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    getUser();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 20),
    );
    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  Future<Uint8List> getBytesFromAsset(String path) async {
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: pixelRatio.round() * 30);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        bottomNavigationBar: BotoomBar(
          index: 2,
        ),
        //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        backgroundColor: const Color(0xffffffff),
        body: SafeArea(
            child: Stack(children: <Widget>[
          Container(
            height: height / 0.5,
            decoration: BoxDecoration(
              color: const Color(0xff00334a),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10, top: 10),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Menu()));
                        },
                        child: Image.asset(
                          "assets/menu.png",
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Profile()));
                  },
                  child: Person(
                      high: 120,
                      width: 120,
                      color: Colors.white,
                      color2: ColorsHelp.background,
                      size: 120,
                      reduis: 80),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  name,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 25,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w700,
                    height: 1.608695652173913,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
                Text(
                  'Daily ticket'.tr(),
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    color: Colors.green,
                    height: 1.608695652173913,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Good Morning '.tr() + '${name.split(' ')[0]} :)',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    color: Colors.green,
                    height: 1.608695652173913,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
                Text(
                  "Where Do You Want \n To Go Today ?".tr(),
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w700,
                    height: 1.608695652173913,
                  ),
                  textAlign: TextAlign.center,
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
              ],
            ),
          ),
          SlidingUpPanel(
            controller: _pc,
            minHeight: height * 0.4,
            maxHeight: height,
            panel: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 80),
                  height: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          color: const Color(0xbfffffff),
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                              width: 1.0, color: const Color(0xbf00334a)),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x1f000000),
                              offset: Offset(0, 3),
                              blurRadius: 6,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 5),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                        color: ColorsHelp.background,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  Container(
                                    height: 5,
                                    width: 2,
                                    decoration: BoxDecoration(
                                        color: ColorsHelp.background,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  Container(
                                    height: 5,
                                    width: 2,
                                    decoration: BoxDecoration(
                                        color: ColorsHelp.background,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  Container(
                                    height: 5,
                                    width: 2,
                                    decoration: BoxDecoration(
                                        color: ColorsHelp.background,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  Container(
                                    height: 5,
                                    width: 2,
                                    decoration: BoxDecoration(
                                        color: ColorsHelp.background,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  Container(
                                    height: 5,
                                    width: 2,
                                    decoration: BoxDecoration(
                                        color: ColorsHelp.background,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  Container(
                                    height: 5,
                                    width: 2,
                                    decoration: BoxDecoration(
                                        color: ColorsHelp.background,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  Container(
                                    height: 5,
                                    width: 2,
                                    decoration: BoxDecoration(
                                        color: ColorsHelp.background,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  Container(
                                    height: 5,
                                    width: 2,
                                    decoration: BoxDecoration(
                                        color: ColorsHelp.background,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  Container(
                                    height: 5,
                                    width: 2,
                                    decoration: BoxDecoration(
                                        color: ColorsHelp.background,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  Container(
                                    height: 5,
                                    width: 2,
                                    decoration: BoxDecoration(
                                        color: ColorsHelp.background,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  Container(
                                    height: 5,
                                    width: 2,
                                    decoration: BoxDecoration(
                                        color: ColorsHelp.background,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  Container(
                                    height: 5,
                                    width: 2,
                                    decoration: BoxDecoration(
                                        color: ColorsHelp.background,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  Container(
                                    height: 5,
                                    width: 2,
                                    decoration: BoxDecoration(
                                        color: ColorsHelp.background,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  Container(
                                    height: 5,
                                    width: 2,
                                    decoration: BoxDecoration(
                                        color: ColorsHelp.background,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  Container(
                                    height: 5,
                                    width: 2,
                                    decoration: BoxDecoration(
                                        color: ColorsHelp.background,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                        color: ColorsHelp.background,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      child: Text(
                                        "From Station ".tr(),
                                        style: TextStyle(
                                            color: ColorsHelp.background),
                                      ),
                                      onTap: () {
                                        _pc.open();
                                        showDialog(true);
                                      },
                                    ),

                                    // IconButton(
                                    //     onPressed: () {},
                                    //     icon: Icon(
                                    //       Icons.my_location,
                                    //       color: ColorsHelp.background,
                                    //     ))
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16),
                                  child: Text(
                                    fromStation,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 250,
                                  height: 3,
                                  color: ColorsHelp.background,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      child: Text(
                                        "To Station ".tr(),
                                        style: TextStyle(
                                            color: ColorsHelp.background),
                                      ),
                                      onTap: () {
                                        _pc.open();
                                        showDialog(false);
                                      },
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16),
                                  child: Text(
                                    toStation,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Visibility(
                                visible: fromStationID != 0 && toStationID != 0,
                                child: Text("No of stations: $noOfStations")),
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Visibility(
                                visible: fromStationID != 0 && toStationID != 0,
                                child: Text("Price: ${noOfStations < 9
                                    ? 5
                                    : noOfStations < 16
                                    ? 7
                                    : 10}")),
                          )),
                      GestureDetector(
                        onTap: createTicket,
                        child: Container(
                            margin: EdgeInsets.only(
                                left: width > 1000
                                    ? width * 0.30
                                    : width > 400
                                        ? width * 0.20
                                        : 100,
                                right: width > 1000
                                    ? width * 0.30
                                    : width > 400
                                        ? width * 0.20
                                        : 100),
                            width: 190.0,
                            height: 55.0,
                            decoration: BoxDecoration(
                              color: const Color(0xff00334a),
                              borderRadius: BorderRadius.circular(28.0),
                            ),
                            child: GestureDetector(
                              onTap: createTicket,
                              child: Center(
                                child: Text(
                                  'Book Ticket'.tr(),
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 13,
                                    color: const Color(0xffffffff),
                                    letterSpacing: 0.65,
                                    fontWeight: FontWeight.w700,
                                    height: 1.2307692307692308,
                                  ),
                                  textHeightBehavior: TextHeightBehavior(
                                      applyHeightToFirstAscent: false),
                                  softWrap: false,
                                ),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),

                // Show current location button
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: GestureDetector(
                //     onTap: () {
                //       context.read<AuthService>().checkWallet(
                //           noOfStations:
                //           (toStationID - fromStationID).toString(),
                //           price: (toStationID - fromStationID) < 9
                //               ? 5
                //               : (toStationID - fromStationID) > 16
                //               ? 7
                //               : 10,
                //           context: context,
                //           ticket: true,
                //           subId: '');
                //     },
                //     child: Container(
                //         margin: EdgeInsets.only(
                //             left: width > 1000
                //                 ? width * 0.45
                //                 : width > 400
                //                     ? width * 0.40
                //                     : 100,
                //             right: width > 1000
                //                 ? width * 0.45
                //                 : width > 400
                //                     ? width * 0.40
                //                     : 100),
                //         width: 190.0,
                //         height: 55.0,
                //         decoration: BoxDecoration(
                //           color: const Color(0xff00334a),
                //           borderRadius: BorderRadius.circular(28.0),
                //         ),
                //         child: GestureDetector(
                //           onTap: () {
                //             context.read<AuthService>().checkWallet(
                //                 noOfStations:
                //                     (toStationID - fromStationID).toString(),
                //                 price: (toStationID - fromStationID) < 9
                //                     ? 5
                //                     : (toStationID - fromStationID) > 16
                //                         ? 7
                //                         : 10,
                //                 context: context,
                //                 ticket: true,
                //                 subId: '');
                //           },
                //           child: Center(
                //             child: Text(
                //               'Book Ticket'.tr(),
                //               style: TextStyle(
                //                 fontFamily: 'Montserrat',
                //                 fontSize: 13,
                //                 color: const Color(0xffffffff),
                //                 letterSpacing: 0.65,
                //                 fontWeight: FontWeight.w700,
                //                 height: 1.2307692307692308,
                //               ),
                //               textHeightBehavior: TextHeightBehavior(
                //                   applyHeightToFirstAscent: false),
                //               softWrap: false,
                //             ),
                //           ),
                //         )),
                //   ),
                // ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: ColorsHelp.background,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    _pc.close();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: ColorsHelp.backgroundG,
                                    size: 30,
                                  )),
                              Text(
                                "Booking Tickets".tr(),
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: GestureDetector(
                              child: Person(
                                  high: 50,
                                  width: 50,
                                  color: Colors.white,
                                  color2: ColorsHelp.background,
                                  size: 40,
                                  reduis: 40),
                            ),
                          )
                        ],
                      )),
                ),

                // Align(
                //     alignment: Alignment(1, 0.3),
                //     child: Container(
                //       child: floating,
                //     )),
              ],
            ),
            collapsed: Column(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0, color: ColorsHelp.background),
                    color: const Color(0xff00334a),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                    ),
                  ),
                  child: Center(
                    child: Container(
                      height: 10,
                      width: 80,
                      color: Colors.green,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ])));
  }

  Future<void> getUser() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      uid = prefs.getString("uid") ?? "";
      email = prefs.getString("email") ?? "";
      name = prefs.getString("name") ?? "";
      phone = prefs.getString("phone") ?? "";
      tagID = prefs.getString("tagID") ?? "";
      nationalID = prefs.getString("nationalID") ?? "";

      //log("email: ${tagID}");
    });
    //return User(uid: "",email: email ,name: name, phone: phone, tagID: tagID, nationalID: nationalID);
  }

  void showDialog(bool from) {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Align(
          alignment: Alignment.center,
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(1, 4), color: Colors.grey, blurRadius: 3)
                  ]),
              height: 120,
              width: 300,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showStations("First Line", 1, from);
                          },
                          child: Container(
                            height: 35,
                            width: 120,
                            decoration: BoxDecoration(
                                color: ColorsHelp.background,
                                borderRadius: BorderRadius.circular(20)),
                            child: GestureDetector(
                              child: Center(
                                child: Text(
                                  "First Line".tr(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: Colors.white,
                                      decoration: TextDecoration.none),
                                ),
                              ),
                              onTap: () {
                                showStations("First Line", 1, from);
                              },
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showStations("Second Line", 2, from);
                          },
                          child: Container(
                            height: 35,
                            width: 120,
                            decoration: BoxDecoration(
                                color: ColorsHelp.background,
                                borderRadius: BorderRadius.circular(20)),
                            child: GestureDetector(
                              child: Center(
                                  child: Text(
                                "Second Line".tr(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    color: Colors.white,
                                    decoration: TextDecoration.none),
                              )),
                              onTap: () {
                                showStations("Second Line", 2, from);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showStations("Third Line", 3, from);
                          },
                          child: Container(
                            height: 35,
                            width: 120,
                            decoration: BoxDecoration(
                                color: ColorsHelp.background,
                                borderRadius: BorderRadius.circular(20)),
                            child: GestureDetector(
                              child: Center(
                                child: Text(
                                  "Third Line".tr(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                      color: Colors.white,
                                      decoration: TextDecoration.none),
                                ),
                              ),
                              onTap: () {
                                showStations("Third Line", 3, from);
                              },
                            ),
                          ),
                        ),
                        Container(
                          height: 35,
                          width: 120,
                        ),
                      ],
                    )
                  ])),
        );
      },
      animationType: DialogTransitionType.size,
      curve: Curves.fastOutSlowIn,
      duration: Duration(seconds: 1),
    );
  }

  void showStations(String lineName, int line, bool from) {
    print(line);
    List<Map<String, Object>> stations = <Map<String, Object>>[];

    Navigator.pop(context);
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return FutureBuilder(
            future: context.read<AuthService>().getStations(line),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              print("snapshot $snapshot");
              if (!snapshot.hasData)
                return Align(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator());

              stations = snapshot.data;
              print(stations);
              return Align(
                  alignment: Alignment(0, 0.4),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        )),
                    // width: 300,
                    // height: 400,
                    child: LineStation(
                      stations: stations,
                      lineName: lineName,
                      onSelected: selectStation,
                      from: from,
                    ),
                  ));
            });
      },
      animationType: DialogTransitionType.slideFromBottomFade,
      curve: Curves.fastOutSlowIn,
      duration: Duration(seconds: 1),
    );
  }

  void selectStation(String name, int id, bool from) {
    log(id.toString());
    Navigator.pop(context);
    setState(() {
      from ? fromStation = name : toStation = name;
      from ? fromStationID = id : toStationID = id;
      noOfStations = (toStationID - fromStationID).abs();
    });
  }

  void createTicket() {
    if(fromStationID != 0 && toStationID != 0) {
      log(noOfStations.toString());
      context.read<AuthService>().checkTicket(
          noOfStations: noOfStations < 9
              ? "9"
              : noOfStations < 16
              ? "16"
              : "17+",
          price: noOfStations < 9
              ? 5
              : noOfStations < 16
              ? 7
              : 10,
          context: context,
          ticket: true,
          subId: '');
    }else{
      log("Pleas select start and end stations");

    }
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
