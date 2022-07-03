import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/View/Profile2.dart';
import 'package:test/View/supsciptions/Subscription%20Details.dart';
import 'package:test/View/supsciptions/TicketPrice.dart';

import '../firebase_auth.dart';
import '../widget/Map Metro.dart';
import '../widget/Person.dart';
import 'About.dart';
import 'SignIn.dart';

class Menu extends StatelessWidget {
  User? user = FirebaseAuth.instance.currentUser;

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
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 100.0),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Image.asset("assets/exist.png"),
                    ),
                  ],
                ),
                /*Person(
                    high: 100,
                    width: 100,
                    color: Colors.white,
                    color2: const Color(0xff00334a),
                    size: 80,
                    reduis: 80),
                SizedBox(
                  height: 20,
                ),*/
                GestureDetector(
                    onTap: () {

                      Navigator.push(context, MaterialPageRoute(builder: (_) => Profile()));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '- Profile'.tr(),
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
                          '    Control your information.'.tr(),
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
                // GestureDetector(
                //     onTap: () {},
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           '- Current balance',
                //           style: TextStyle(
                //             fontFamily: 'Montserrat',
                //             fontSize: 23,
                //             color: const Color(0xffffffff),
                //             fontWeight: FontWeight.w700,
                //             height: 1.608695652173913,
                //           ),
                //           textHeightBehavior: TextHeightBehavior(
                //               applyHeightToFirstAscent: false),
                //           softWrap: false,
                //         ),
                //         Text(
                //           '    Control payment methods and wallet.',
                //           style: TextStyle(
                //             fontFamily: 'Montserrat',
                //             fontSize: 12,
                //             color: const Color(0xffffffff),
                //             height: 1.5833333333333333,
                //           ),
                //           textHeightBehavior: TextHeightBehavior(
                //               applyHeightToFirstAscent: false),
                //           softWrap: false,
                //         ),
                //       ],
                //     )),
                // SizedBox(
                //   height: 15,
                // ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => SupscripDetails1()));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '- Subscription Details'.tr(),
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
                        '    Metro Subscription plans & How to Subscribe.'.tr(),
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
                /*GestureDetector(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '- Guide'.tr(),
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
                        '    Guideline to help you reach your destination.'.tr(),
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
                ),*/
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => MapMetro()));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '- Metro map'.tr(),
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
                        '    Show all Metro lines and stations.'.tr(),
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
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => TicketPrice()));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '- Book metro ticket'.tr(),
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
                        '    search for an in/out stations to book a ticket.'.tr(),
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
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => About()));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '- About'.tr(),
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
                        '    Information about the app and how to use it.'.tr(),
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
                    onTap: () async {
                      await context.read<AuthService>().signOut();

                      Navigator.of(context)
                          .pushReplacementNamed(SignIn.routeName);
                    },
                    child: Center(
                      child: Text(
                        'Sign out'.tr(),
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
