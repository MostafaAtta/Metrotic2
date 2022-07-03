import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../firebase_auth.dart';
import '../SignUp.dart';


class SignUpWeb extends StatefulWidget {
  const SignUpWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpWeb> createState() => _SignUpWebState();
}

class _SignUpWebState extends State<SignUpWeb> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController tagIDController = TextEditingController();
  final TextEditingController nationalIDController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
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
              color: const Color(0xffdedddd),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  Row(
                    children: [
                      SizedBox(
                        width: 140,
                      ),
                      Expanded(
                        child: TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Full name'.tr(),
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
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      SizedBox(
                        width: 140,
                      ),
                      Expanded(
                        child: TextField(
                          controller: phoneController,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Phone number'.tr(),
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
                          keyboardType: TextInputType.phone,
                        ),
                      ),
                      SizedBox(
                        width: 140,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 140,
                      ),
                      Expanded(
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
                      SizedBox(
                        width: 140,
                      ),
                      Expanded(
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
                        width: 140,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 140,
                      ),
                      Expanded(
                        child: TextField(
                          controller: nationalIDController,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'National ID'.tr(),
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
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(
                        width: 140,
                      ),
                      Expanded(
                        child: TextField(
                          controller: tagIDController,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Tag ID'.tr(),
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
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      SizedBox(
                        width: 140,
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                      onTap: () {

                        context.read<AuthService>().signUp(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                            name: nameController.text.trim(),
                            phone: phoneController.text.trim(),
                            tagID: tagIDController.text.trim(),
                            nationalID: nationalIDController.text.trim(),
                            context: context
                        );

                      },
                    child: Container(
                        margin: EdgeInsets.only(
                            left: width > 400
                                ? width * 0.40
                                : 100,
                            right: width > 400
                                ? width * 0.40
                                : 100),
                        padding: const EdgeInsets.all(8),
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
                                context: context
                            );

                          },
                          child: Center(
                            child: Text(
                              'Register'.tr(),
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

                  GestureDetector(
                    onTap: ()=> Navigator.of(context).pushReplacementNamed(SignUp.routeName),
                    child: Text(
                      "Already have account? Login".tr(),
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
