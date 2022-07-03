import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../View/SignUp.dart';

class BackGround extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;

    return Container(
        height:height*0.5,
        width: width,
        decoration: BoxDecoration(
          color: const Color(0xff00334a),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
          ),
        ),
          child:Stack(
          children: [

            Center(
                child:
                Image.asset("assets/logo.png")

            ),

           Positioned(

bottom: 0,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [

             Container(
               margin: EdgeInsets.only(left: 20,right: width>500?MediaQuery.of(context).size.width*0.5:width*0.3),



               child:     Column(


               children: [

                 Container(
                   child: Text(
                     'Log In'.tr(),
                     style: TextStyle(
                       fontFamily: 'Montserrat',
                       fontSize: 20,
                       color: const Color(0xffffffff),
                       letterSpacing: 0.8,
                       fontWeight: FontWeight.w700,
                       height: 1.5,
                     ),
                     textHeightBehavior:
                     TextHeightBehavior(applyHeightToFirstAscent: false),
                     textAlign: TextAlign.center,
                     softWrap: false,
                   ),
                 ),
                 Container(
                   height: height/120,width: width*0.30,
                   decoration: BoxDecoration(
                       color: Colors.green,

                       borderRadius: BorderRadius.circular(10)
                   ),
                 )
               ],),),
                 GestureDetector(
                   onTap: () {
                     Navigator.push(
                         context, MaterialPageRoute(builder: (_) => SignUp()));
                   },
                   child: Container(

                     child: Text(
                       'Sign Up'.tr(),
                       style: TextStyle(
                         fontFamily: 'Montserrat',
                         fontSize: 20,
                         color: const Color(0xffffffff),
                         letterSpacing: 0.8,
                         fontWeight: FontWeight.w700,
                         height: 1.5,
                       ),
                       textHeightBehavior:
                       TextHeightBehavior(applyHeightToFirstAscent: false),
                       textAlign: TextAlign.center,
                       softWrap: false,
                     ),
                   ),
                 ),

               ],
             ) ,
           )
          ],
        )


    );



  }
}
