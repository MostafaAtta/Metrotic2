import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../firebase_auth.dart';
import 'SignIn.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const routeName = "/reset_password";

  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250,
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
              height: 5,
            ),
            Text(
              'Please enter your email address'.tr(),
              style: TextStyle(
                color: const Color(0xff00334a),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0))),
                labelText: "Email".tr(),
                hintText: "Enter Your Email".tr(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                context.read<AuthService>().resetPassword(
                    email: emailController.text.trim(), context: context);

                Navigator.of(context).pushReplacementNamed(SignIn.routeName);
              },
              child: Container(
                  margin: EdgeInsets.only(
                      left: width > 1000
                          ? width * 0.45
                          : width > 400
                              ? width * 0.40
                              : 100,
                      right: width > 1000
                          ? width * 0.45
                          : width > 400
                              ? width * 0.40
                              : 100),
                  width: 190.0,
                  height: 55.0,
                  decoration: BoxDecoration(
                    color: const Color(0xff00334a),
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      context.read<AuthService>().resetPassword(
                          email: emailController.text.trim(), context: context);

                      Navigator.of(context)
                          .pushReplacementNamed(SignIn.routeName);
                    },
                    child: Center(
                      child: Text(
                        'Reset password'.tr(),
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
      ),
    );
  }
}
