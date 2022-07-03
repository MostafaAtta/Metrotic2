import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../firebase_auth.dart';

class TicketWidget extends StatelessWidget {
  String noOfStations;
  int price;
  String name;

  TicketWidget(
      {Key? key,
      required this.noOfStations,
      required this.price,
      required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xff00334a),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(19.0),
                topRight: const Radius.circular(19.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x29000000),
                  offset: Offset(0, 3),
                  blurRadius: 6,
                ),
              ],
            ),
            padding: EdgeInsets.only(left: 32, top: 16, right: 32, bottom: 16),
            child: Text(
              name,
              style: TextStyle(
                fontFamily: 'Hacen Promoter Md',
                fontSize: 22,
                color: const Color(0xff00da82),
                height: 0.48,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
              softWrap: false,
            ),
          ),
          Container(
            padding: EdgeInsets.all(46),
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(19.0),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x29000000),
                  offset: Offset(0, 3),
                  blurRadius: 6,
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  noOfStations + ' Stations'.tr(),
                  style: TextStyle(
                    fontFamily: 'Hacen Promoter Md',
                    fontSize: 41,
                    color: const Color(0xff00334a),
                    height: 1.1951219512195121,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.right,
                  softWrap: false,
                ),
                Text(
                  '$price L.E',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 56,
                    color: const Color(0xff00da82),
                    fontWeight: FontWeight.w700,
                    height: 1.5892857142857142,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  textAlign: TextAlign.center,
                  softWrap: false,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 80,
          ),
          GestureDetector(
            onTap: () {
              context.read<AuthService>().checkTicket(
                  noOfStations: noOfStations,
                  price: price,
                  context: context,
                  ticket: true,
                  subId: '');
            },
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xff00334a),
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x29000000),
                    offset: Offset(0, 3),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Text(
                'Book Now'.tr(),
                style: TextStyle(
                  fontFamily: 'Hacen Promoter Md',
                  fontSize: 20,
                  color: const Color(0xffffffff),
                  height: 1.146341463414634,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                textAlign: TextAlign.center,
                softWrap: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
