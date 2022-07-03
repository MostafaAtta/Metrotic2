import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Controller/PickImage.dart';
import '../firebase_auth.dart';
import '../helper.dart';
import '../models/user.dart';
import '../widget/AppBar.dart';
import '../widget/Person.dart';
import '../widget/botom Bar.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({Key? key}) : super(key: key);

  @override
  _ChangeLanguageState createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {

  late User user;

  @override
  Widget build(BuildContext context) {
    var provider = context.read<AuthService>();

    return Scaffold(
        bottomNavigationBar: BotoomBar(
          index: 5,
        ),
        body: SafeArea(
                child: ListView(
              children: [
                Column(
                  children: [
                    AppBarr(text: "Change Language".tr()),
                    SizedBox(
                      height: 20,
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Select your language '.tr(),
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            color: const Color(0xff00334a),
                            height: 1.5833333333333333,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            context.setLocale(Locale('en', 'US'));
                          },
                          child: Text(
                            'English',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 22,
                              color: const Color(0xff00da82),
                              letterSpacing: 1.1,
                              fontWeight: FontWeight.w700,
                              height: 1.5,
                            ),
                            textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                            textAlign: TextAlign.start,
                            softWrap: false,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 8, right: 8),
                          height: 2,
                          width: double.infinity,
                          color: Colors.green,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            context.setLocale(Locale('ar', 'EG'));
                          },
                          child: GestureDetector(
                            child: Text(
                              'اللغة العربية',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 22,
                                color: const Color(0xff00334a),
                                letterSpacing: 1.1,
                                fontWeight: FontWeight.w700,
                                height: 1.5,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              textAlign: TextAlign.start,
                              softWrap: false,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ))
          ,
        );
  }

}
