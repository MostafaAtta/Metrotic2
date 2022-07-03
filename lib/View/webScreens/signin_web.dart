import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/View/SignUp.dart';
import 'package:test/View/webScreens/reset_password_web.dart';

import '../../firebase_auth.dart';
import '../SignIn.dart';


class SignInWeb extends StatefulWidget {
  const SignInWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInWeb> createState() => _SignInWebState();
}

class _SignInWebState extends State<SignInWeb> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Stack(children: [
              Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: const Image(image: AssetImage('images/train.png'), fit: BoxFit.fill)),
              Container(
                padding: EdgeInsets.all(8),
                width: width / 2,
                height: 100,
                color: Color(0xff19475b),
                child: Center(child: Image.asset('images/logo.png')),
              )
            ]),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: const Color(0xffdedddd),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Enter Your account details'.tr(),
                    style: TextStyle(
                      fontFamily: 'Hacen Promoter Md',
                      fontSize: 40,
                      color: Color(0xff19475b),
                      height: 1.169811320754717,
                    ),
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.center,
                    softWrap: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: width > 1000
                            ? width * 0.08
                            : width > 400
                                ? width * 0.16
                                : 100,
                        right: width > 1000
                            ? width * 0.08
                            : width > 400
                                ? width * 0.16
                                : 100),
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Email'.tr(),
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
                  Container(
                    margin: EdgeInsets.only(
                        left: width > 1000
                            ? width * 0.08
                            : width > 400
                                ? width * 0.16
                                : 100,
                        right: width > 1000
                            ? width * 0.08
                            : width > 400
                                ? width * 0.16
                                : 100),
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        labelText: 'Password'.tr(),
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
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      /*context.read<AuthService>().signIn(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                        context: context,
                      );*/
                    },
                    child: Container(
                        margin: EdgeInsets.only(
                            left: width > 1000
                                ? width * 0.15
                                : width > 400
                                    ? width * 0.40
                                    : 100,
                            right: width > 1000
                                ? width * 0.15
                                : width > 400
                                    ? width * 0.40
                                    : 100),
                        padding: const EdgeInsets.all(8),
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
                                fontSize: 20,
                                color: Color(0xffffffff),
                                letterSpacing: 0.65,
                                fontWeight: FontWeight.w700,
                                height: 1.2307692307692308,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
                            ),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: ()=> Navigator.of(context).pushReplacementNamed(SignUp.routeName),
                    child: Text(
                      "Don't have account? Register".tr(),
                      style: TextStyle(
                        fontFamily: 'Hacen Promoter Md',
                        fontSize: 24,
                        color: Color(0xff00334a),
                        height: 1.75,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.right,
                      softWrap: false,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: ()=> Navigator.of(context).pushReplacementNamed(ResetPasswordWeb.routeName),
                    child: Text(
                      'Forgot password?'.tr(),
                      style: TextStyle(
                        fontFamily: 'Hacen Promoter Md',
                        fontSize: 24,
                        color: Color(0xff00334a),
                        height: 1.75,
                      ),
                      textHeightBehavior:
                          TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.right,
                      softWrap: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
