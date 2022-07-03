

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../firebase_auth.dart';
import '../SignIn.dart';


class ResetPasswordWeb extends StatefulWidget {

  static const routeName = "/reset_password";


  const ResetPasswordWeb({Key? key}) : super(key: key);

  @override
  State<ResetPasswordWeb> createState() => _ResetPasswordWebState();
}

class _ResetPasswordWebState extends State<ResetPasswordWeb> {

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(8),
                width: width,
                height: 100,
                color: Color(0xff19475b),
                child: Center(child: Image.asset('images/logo.png')),
              ),
            ),
            Expanded(
              flex: 12,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Text(
                      'Reset Password'.tr(),
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff00334a),

                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: width > 1000? width * 0.20 : width > 400
                              ? width * 0.40
                              : 100,
                          right: width > 1000? width * 0.20 : width > 400
                              ? width * 0.40
                              : 100),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Please enter your email address'.tr(),
                          style: TextStyle(
                            fontSize: 16,
                            color: const Color(0xff00334a),

                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: width > 1000? width * 0.20 : width > 400
                            ? width * 0.40
                            : 100,
                        right: width > 1000? width * 0.20 : width > 400
                            ? width * 0.40
                            : 100),
                      child: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'Email',
                          labelStyle:
                          TextStyle(fontSize: 16.0, color: Color(0xff00334a)),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: Color(0xff00334a)),
                            borderRadius: BorderRadius.zero,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 2, color: Color(0xff00334a)),
                            borderRadius: BorderRadius.zero,
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,

                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {

                            Navigator.of(context).pushReplacementNamed(
                                SignIn.routeName);


                          },
                          child: Container(
                              margin: EdgeInsets.only(right: 8),
                            padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: const Color(0xff00334a),
                                borderRadius: BorderRadius.circular(28.0),
                              ),
                              child: GestureDetector(
                                onTap: () {

                                  Navigator.of(context).pushReplacementNamed(
                                      SignIn.routeName);

                                },
                                child: Center(

                                  child: Text(
                                    'Cancel'.tr(),
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 13,
                                      color: const Color(0xffffffff),
                                      letterSpacing: 0.65,
                                      fontWeight: FontWeight.w700,
                                      height: 1.2307692307692308,
                                    ),
                                    textHeightBehavior:
                                    TextHeightBehavior(applyHeightToFirstAscent: false),
                                    softWrap: false,
                                  ),
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () {

                            context.read<AuthService>().resetPassword(
                              email: emailController.text.trim(),
                              context: context
                            );

                            Navigator.of(context).pushReplacementNamed(
                                SignIn.routeName);


                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 8),
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: const Color(0xff00334a),
                                borderRadius: BorderRadius.circular(28.0),
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  context.read<AuthService>().resetPassword(
                                    email: emailController.text.trim(),
                                      context: context
                                  );

                                  Navigator.of(context).pushReplacementNamed(
                                      SignIn.routeName);

                                },
                                child: Center(

                                  child: Text(
                                    'Reset password',
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 13,
                                      color: const Color(0xffffffff),
                                      letterSpacing: 0.65,
                                      fontWeight: FontWeight.w700,
                                      height: 1.2307692307692308,
                                    ),
                                    textHeightBehavior:
                                    TextHeightBehavior(applyHeightToFirstAscent: false),
                                    softWrap: false,
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
