import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metrotic/widget/Person.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: SafeArea(

          child: Container(
            padding: EdgeInsets.only(left: 15),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color(0xff00334a),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
              ),
            ),
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 50.0),
            child: ListView(

              children: [
                Row(mainAxisAlignment: MainAxisAlignment.end,children: [ GestureDetector(onTap: (){Navigator.of(context).pop();},
                  child: Image.asset("assets/exist.png"),
                ),    ],),
                Person(high: 100, width: 100, color: Colors.white, color2: const Color(0xff00334a), size: 80, reduis: 80),
                SizedBox(height: 20,),

                GestureDetector(
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '- Profile',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 23,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w700,
                            height: 1.608695652173913,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          softWrap: false,
                        ),
                        Text(
                          '    Control your information.',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                            color: const Color(0xffffffff),
                            height: 1.5833333333333333,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          softWrap: false,
                        ),
                      ],
                    )),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '- Current balance',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 23,
                            color: const Color(0xffffffff),
                            fontWeight: FontWeight.w700,
                            height: 1.608695652173913,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          softWrap: false,
                        ),
                        Text(
                          '    Control payment methods and wallet.',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12,
                            color: const Color(0xffffffff),
                            height: 1.5833333333333333,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          softWrap: false,
                        ),
                      ],
                    )),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '- Subscription Details',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 23,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                          height: 1.608695652173913,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                      Text(
                        '    Metro Subscription plans & How to Subscribe.',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12,
                          color: const Color(0xffffffff),
                          height: 1.5833333333333333,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '- Guide',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 23,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                          height: 1.608695652173913,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                      Text(
                        '    Guideline to help you reach your destination.',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12,
                          color: const Color(0xffffffff),
                          height: 1.5833333333333333,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '- Metro map',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 23,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                          height: 1.608695652173913,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                      Text(
                        '    Show all Metro lines and stations.',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12,
                          color: const Color(0xffffffff),
                          height: 1.5833333333333333,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '- Book metro ticket',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 23,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                          height: 1.608695652173913,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                      Text(
                        '    search for an in/out stations to book a ticket.',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12,
                          color: const Color(0xffffffff),
                          height: 1.5833333333333333,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '- About',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 23,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                          height: 1.608695652173913,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                      Text(
                        '    Information about the app and how to use it.',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 12,
                          color: const Color(0xffffffff),
                          height: 1.5833333333333333,
                        ),
                        textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                    child: Center(
                  child: Text(
                    'Sign out',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 29,
                      color: const Color(0xffffffff),
                      fontWeight: FontWeight.w700,
                      height: 1.6206896551724137,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    softWrap: false,
                  ),
                )),
              ],
            ),
          ),

          //   child: SvgPicture.string(
          //     _svg_fc5q9y,
          //     allowDrawingOutsideViewBox: true,
          //     fit: BoxFit.fill,
          //   ),
        ));
  }
}

const String _svg_fc5q9y =
    '<svg viewBox="210.5 895.0 6.2 1.0" ><path transform="translate(210.5, 895.0)" d="M 0 0 L 6.21197509765625 0" fill="none" stroke="#00da82" stroke-width="10" stroke-miterlimit="4" stroke-linecap="round" /></svg>';