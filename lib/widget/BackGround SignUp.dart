import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../View/SignIn.dart';

class BackGroundSignUp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return
      Container(

        width: width,
        decoration: BoxDecoration(
          color: const Color(0xff00334a),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
          ),


        ),
        child: Column(children: [

          SizedBox(
            height: height*0.10-50,
          ),
          Center(
              child:
              Image.asset("assets/logo.png",)

          )
          ,
          SizedBox(height:    height*0.10-55,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>SignIn()));
                },
                child:   Container(

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
              ),
              Column(children: [

                Container(
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

               Container(
                 height: height/200,width: width*0.30,
                 decoration: BoxDecoration(
                     color: Colors.green,

                     borderRadius: BorderRadius.circular(10)
                 ),
               )
              ],)

            ],
          )


        ],),
      );





  }
}