import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:test/View/reset_password.dart';

import '../firebase_auth.dart';
import '../widget/BackGround.dart';
import 'HomScreen.dart';

class SignIn extends StatefulWidget {

  static const routeName = "/sign_in";

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  User? user = FirebaseAuth.instance.currentUser;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: SafeArea(
          child: ListView(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height*0.4,
                child:  BackGround(),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                width: double.infinity,
                //margin: EdgeInsets.all(8.0),
                padding: EdgeInsets.only(left:width>1000?width*0.20:width> 400?width*0.15:30,right: width>1000?width*0.20:width> 400?width*0.15:30),
                //margin: EdgeInsets.only(left:width>1000?width*0.20:width> 400?width*0.15:30,right: width>1000?width*0.20:width> 400?width*0.15:30),
                child:Column(
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
                        labelText: "Email".tr(),
                        hintText: "Enter Your Email".tr(),
                      ),
                      keyboardType: TextInputType.emailAddress,

                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
                        labelText: "Password".tr(),
                        hintText: "Enter Your Password".tr(),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  context.read<AuthService>().signIn(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                    context: context,
                  );


                },
                child: Container(
                    margin: EdgeInsets.only(left:width>1000?width*0.45:width> 400?width*0.40:100,right: width>1000?width*0.45:width> 400?width*0.40:100),
                    width: 190.0,
                    height: 55.0,
                    decoration: BoxDecoration(
                      color: const Color(0xff00334a),
                      borderRadius: BorderRadius.circular(28.0),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        context.read<AuthService>().signIn(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                          context: context,
                        );


                      },
                      child: Center(

                        child: Text(
                          'log in'.tr(),
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
              SizedBox(height: 10,),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                      ResetPasswordScreen.routeName);
                },
                child: Center(
                  child: Text(
                    'Forgot password?'.tr(),
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 13,
                      color: const Color(0xff00334a),
                      letterSpacing: 0.65,
                      fontWeight: FontWeight.w700,
                      height: 1.2307692307692308,
                    ),
                    textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                    softWrap: false,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
