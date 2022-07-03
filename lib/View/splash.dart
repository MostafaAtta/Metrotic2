import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test/View/webScreens/home_screen_web.dart';
import 'package:test/View/webScreens/signin_web.dart';

import 'HomeSplash.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}


class _SplashState extends State<Splash> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Map<int, Widget> output = {1: HomeSplash()};

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(nextScreen: kIsWeb
        ? (user == null ? SignInWeb() : HomeScreenWeb())
        : HomeSplash(),
        splash: Image(image: AssetImage('assets/logo.png'),),
        splashTransition: SplashTransition.sizeTransition,
        backgroundColor: const Color(0xff00334a)
      // imagePath:'assets/logo.png', home: Home(),
      // backGroundColor:const Color(0xff00334a),
      // customFunction:  (){
      //   player.play();
      //   return 1;
      // },
      // duration: 4000,
      // outputAndHome: output,
      // type: CustomSplashType.BackgroundProcess,
      //   animationEffect: 'zoom-in',

    );
  }
}
