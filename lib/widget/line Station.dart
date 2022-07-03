import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../helper.dart';
import 'Line.dart';

class LineStation extends StatelessWidget {
  List<Map<String, Object>> stations = <Map<String, Object>>[];
  String lineName;
  Function(String name, int id, bool from) onSelected;
  bool from;

  LineStation(
      {Key? key,
      required this.stations,
      required this.lineName,
      required this.onSelected,
      required this.from})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      height: 300,
      color: Colors.white,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            lineName,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: ColorsHelp.background,
                decoration: TextDecoration.none),
          ),
        ),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: stations.length,
              itemBuilder: (BuildContext cxt, int i) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              color: ColorsHelp.background,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          child: Text(
                            stations[i]['name'] as String,
                            style: TextStyle(
                                color: ColorsHelp.background,
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none),
                          ),
                          onTap: () => onSelected(
                            stations[i]['name'] as String,
                            stations[i]['Station ID'] as int,
                            from
                          ),
                        )
                      ],
                    ),
                    Visibility(
                      child:
                          Align(alignment: Alignment.centerLeft, child: Line()),
                      visible: i != stations.length - 1,
                    ),
                  ],
                );
              }),
        ),
      ]),
    );
  }
}
