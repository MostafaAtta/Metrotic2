import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helper.dart';
import '../../widget/AppBar.dart';
import '../../widget/botom Bar.dart';
import 'Plans.dart';
import 'TicketPrice.dart';

class SupscripDetails1 extends StatefulWidget {
  const SupscripDetails1({Key? key}) : super(key: key);

  @override
  _SupscripDetails1State createState() => _SupscripDetails1State();
}

class _SupscripDetails1State extends State<SupscripDetails1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BotoomBar(
          index: 1,
        ),
        body: SafeArea(
            child: Column(
          children: [
            AppBarr(text: ("Subscription \nDetails".tr())),
            SizedBox(
              height: 80,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => TicketPrice()));
              },
              child: Container(
                height: 150,
                width: 300,
                decoration: BoxDecoration(
                    color: ColorsHelp.background,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(1, 3),
                          blurRadius: 3,
                          color: Colors.grey)
                    ]),
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Image.asset(
                      "assets/mon.png",
                      height: 60,
                      width: 60,
                      filterQuality: FilterQuality.high,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Tickets Price'.tr(),
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 25,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Divider(
              color: ColorsHelp.background,
              thickness: 2,
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Plans()));
              },
              child: Container(
                height: 150,
                width: 300,
                decoration: BoxDecoration(
                    color: ColorsHelp.background,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(1, 3),
                          blurRadius: 3,
                          color: Colors.grey)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/cash.png",
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Plans'.tr(),
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 30,
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                  ],
                ),
              ),
            )
          ],
        )));
  }
}
