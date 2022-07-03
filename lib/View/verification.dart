import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../firebase_auth.dart';
import '../widget/Verfiey.dart';
import 'HomScreen.dart';



class Verification extends StatefulWidget {


  static const routeName = "/verification";

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final TextEditingController _fieldOne = TextEditingController();

  final TextEditingController _fieldTwo = TextEditingController();

  final TextEditingController _fieldThree = TextEditingController();

  final TextEditingController _fieldFour = TextEditingController();

  final TextEditingController _fieldFive = TextEditingController();

  final TextEditingController _fieldSix = TextEditingController();

  String code = '';
  String verificationIdFinal = '';

  void setData(String verificationId) {
    setState(() {
      verificationIdFinal = verificationId;
    });
  }

  @override
  Widget build(BuildContext context) {

    final routeArg = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;

    //log(routeArg['phone'].toString());

    context.read<AuthService>().verifyPhone(phone: routeArg['phone'].toString(), context: context, setData: setData);

    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color(0xfff5f5f5),
        body: SafeArea(
          child:ListView(

            children: <Widget>[
              Column(
                  children: <Widget>[

                    Container(
                      height: MediaQuery.of(context).size.height*0.5,
                      child:
                      Stack(
                        children: [

                          Container(
                              height: MediaQuery.of(context).size.height*0.3+50,
                              decoration: BoxDecoration(
                                color: const Color(0xff00334a),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(30.0),
                                  bottomLeft: Radius.circular(30.0),
                                ),
                              ),
                              child:Column(children: [


                                SizedBox(height:    height*0.12),


                                Center(
                                    child: Image.asset("assets/logo.png")
                                )
                              ],)
                          ),



                          Positioned(child: Align(
                              alignment: Alignment(0.002, -0.283),
                              child:
                              Container(
                                width: 156,
                                height: 156,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                                ),
                                margin: EdgeInsets.fromLTRB(15.8, 20.1, 16.4, 12.1),
                                child:   SizedBox.expand(
                                    child: Icon(Icons.person)
                                ),
                              )

                          ),
                            top: MediaQuery.of(context).size.height*0.25,
                            left: 50,
                            right:50,),


                        ],
                      ),

                    ),
                    SizedBox(height: 20,)

                    ,
                    SizedBox(
                      width: 114.0,
                      height: 16.0,
                      child: Text(
                        'Confirm Account'.tr(),
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 13,
                          color: const Color(0xff00334a),
                          fontWeight: FontWeight.w500,
                          height: 1.5384615384615385,
                        ),
                        textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                        softWrap: false,
                      ),
                    ),
                    SizedBox(height: 20,),

                    Padding(
                      padding: EdgeInsets.only(left :width>400?width*0.25:width>1000?0.50: 25,right:width>400?width*0.25:width>1000?0.50: 25),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [
                            OtpInput(_fieldOne,true),
                            OtpInput(_fieldTwo,false),
                            OtpInput(_fieldThree,false),
                            OtpInput(_fieldFour,false),
                            OtpInput(_fieldFive,false),
                            OtpInput(_fieldSix,false),
                          ]
                      ),
                    ),
                    SizedBox(height: 30,),
                    GestureDetector(
                      onTap: (){
                        code = _fieldOne.text + _fieldTwo.text + _fieldThree.text +
                            _fieldFour.text + _fieldFive.text + _fieldSix.text;

                        context.read<AuthService>().signInWithPhoneNumber(verificationIdFinal, code, context);

                      },
                      child:  Container(
                          width: 120.0,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xff00334a),
                            borderRadius: BorderRadius.circular(28.0),
                          ),   child: Center(child: Text(
                        'confirm'.tr(),
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 13,
                          color: const Color(0xffffffff),
                          letterSpacing: 0.65,
                          fontWeight: FontWeight.w700,
                          height: 1.2307692307692308,
                        ),
                        textHeightBehavior: TextHeightBehavior(
                            applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),)
                      ),
                    ),
                    SizedBox(height: 10,),

                    Text(
                      '* Code sent to your phone number *'.tr(),
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        color: const Color(0xff00334a),
                        height: 1.5714285714285714,
                      ),
                      textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                      softWrap: false,
                    ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      child: Text(
                        'Didn\'t receive your code ?'.tr(),
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          color: const Color(0xff006032),
                          fontWeight: FontWeight.w700,
                          height: 1.5714285714285714,
                        ),
                        textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                    ),
                    SizedBox(height: 10,),





                  ]

              )
            ],
          ),)
    );
  }
}
