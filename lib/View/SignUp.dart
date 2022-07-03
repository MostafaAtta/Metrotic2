import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../firebase_auth.dart';
import '../widget/BackGround SignUp.dart';
import 'SignIn.dart';

class SignUp extends StatefulWidget {
  static const routeName = "/sign_up";

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  User? user = FirebaseAuth.instance.currentUser;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController tagIDController = TextEditingController();
  final TextEditingController nationalIDController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: SafeArea(
            child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              child: BackGroundSignUp(),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                  left: width > 1000
                      ? width * 0.17
                      : width > 500
                          ? width * 0.12
                          : 25,
                  right: width > 1000
                      ? width * 0.17
                      : width > 500
                          ? width * 0.12
                          : 25),
              //margin: EdgeInsets.only(left:width>1000?width*0.17:width> 500?width*0.12:25,right: width>1000?width*0.17:width> 500?width*0.12:25),

              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(32.0))),
                      labelText: "Name".tr(),
                      hintText: "Enter Your Full Name".tr(),
                    ),
                    keyboardType: TextInputType.name,
                    autofocus: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(32.0))),
                      labelText: "Phone Number".tr(),
                      hintText: "Enter Your Number".tr(),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(32.0))),
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
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(32.0))),
                      labelText: "Password".tr(),
                      hintText: "Enter Your Password".tr(),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: tagIDController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(32.0))),
                      labelText: "Tag ID".tr(),
                      hintText: "Enter Your Tag ID".tr(),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: nationalIDController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(32.0))),
                      labelText: "National ID".tr(),
                      hintText: "Enter Your National ID".tr(),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                margin: EdgeInsets.only(
                    left: width > 1000
                        ? width * 0.35
                        : width > 500
                            ? width * 0.30
                            : 70,
                    right: width > 1000
                        ? width * 0.35
                        : width > 500
                            ? width * 0.30
                            : 70),
                width: 190.0,
                height: 55.0,
                decoration: BoxDecoration(
                  color: const Color(0xff00334a),
                  borderRadius: BorderRadius.circular(28.0),
                ),
                child: GestureDetector(
                  onTap: () {
                    context.read<AuthService>().signUp(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                        name: nameController.text.trim(),
                        phone: phoneController.text.trim(),
                        tagID: tagIDController.text.trim(),
                        nationalID: nationalIDController.text.trim(),
                        context: context);
                  },
                  child: Center(
                    child: Text(
                      'Sign Up'.tr(),
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
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?'.tr(),
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
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => SignIn()));
                  },
                  child: Text(
                    'Login'.tr(),
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
                )
              ],
            )
          ],
        )));
  }
}
