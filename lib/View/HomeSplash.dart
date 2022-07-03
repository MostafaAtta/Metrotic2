import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Authentication.dart';
import 'HomScreen.dart';
import 'SignIn.dart';

class HomeSplash extends StatefulWidget {
  const HomeSplash({Key? key}) : super(key: key);

  @override
  _HomeSplashState createState() => _HomeSplashState();
}

class _HomeSplashState extends State<HomeSplash> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
            onTap: () {
              if (user != null) {
                Navigator.of(context).pushReplacementNamed(Home.routeName);
              } else {
                Navigator.of(context).pushReplacementNamed(SignIn.routeName);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff00334a),
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  Image.asset("assets/logo.png"),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.setLocale(Locale('en', 'US'));
                        },
                        child: Text(
                          'EN',
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
                          textAlign: TextAlign.center,
                          softWrap: false,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 20,
                        width: 2,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.setLocale(Locale('ar', 'EG'));
                        },
                        child: GestureDetector(
                          child: Text(
                            'AR',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 22,
                              color: const Color(0xffffffff),
                              letterSpacing: 1.1,
                              fontWeight: FontWeight.w700,
                              height: 1.5,
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.center,
                            softWrap: false,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
