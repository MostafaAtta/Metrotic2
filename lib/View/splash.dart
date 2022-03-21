import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'HomeSplash.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}



class _SplashState extends State<Splash> {
  AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    player.setAsset('assets/rocket.mp3');
    player.play();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();

    // TODO: implement dispose
    super.dispose();
  }
  Map<int, Widget> output = {1: HomeSplash()};

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(nextScreen: HomeSplash(),
        splash:Image(image:AssetImage('assets/logo.png') ,) ,
        splashTransition: SplashTransition.sizeTransition,
        backgroundColor:const Color(0xff00334a)
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
