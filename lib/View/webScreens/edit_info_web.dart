import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../firebase_auth.dart';
import '../../models/user.dart';
import 'header.dart';
import 'menu_web.dart';

class EditInfoWeb extends StatefulWidget {
  const EditInfoWeb({
    Key? key,
  }) : super(key: key);

  static const routeName = "/edit_profile";

  @override
  State<EditInfoWeb> createState() => _EditInfoWebState();
}

class _EditInfoWebState extends State<EditInfoWeb> {
  late User user;

  @override
  Widget build(BuildContext context) {
    var provider = context.read<AuthService>();
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: FutureBuilder(
          future: provider.getLocalUser(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (!snapshot.hasData) return Container();

            user = snapshot.data;

            print(user.uid);

            return Container(
              child: Row(
                children: [
                  Expanded(flex: 3, child: MenuWeb()),
                  Expanded(
                    flex: 12,
                    child: Column(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Header(
                              title: 'Edit Information'.tr(),
                            )),
                        Expanded(
                          flex: 12,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
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
                                        controller: TextEditingController()
                                          ..text = user.name,
                                        onChanged: (text) => user.name = text,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          labelText: 'Full name'.tr(),
                                          labelStyle: TextStyle(
                                              fontSize: 16.0,
                                              color: Color(0xff00334a)),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 2,
                                                color: Color(0xff00334a)),
                                            borderRadius: BorderRadius.zero,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 2,
                                                color: Color(0xff00334a)),
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
                                        controller: TextEditingController()
                                          ..text = user.phone,
                                        onChanged: (text) => user.phone = text,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          labelText: 'Phone number'.tr(),
                                          labelStyle: TextStyle(
                                              fontSize: 16.0,
                                              color: Color(0xff00334a)),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 2,
                                                color: Color(0xff00334a)),
                                            borderRadius: BorderRadius.zero,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 2,
                                                color: Color(0xff00334a)),
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
                                        controller: TextEditingController()
                                          ..text = user.email,
                                        onChanged: (text) => user.email = text,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          labelText: 'Email'.tr(),
                                          labelStyle: TextStyle(
                                              fontSize: 16.0,
                                              color: Color(0xff00334a)),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 2,
                                                color: Color(0xff00334a)),
                                            borderRadius: BorderRadius.zero,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 2,
                                                color: Color(0xff00334a)),
                                            borderRadius: BorderRadius.zero,
                                          ),
                                        ),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 140,
                                    ),
                                    Expanded(
                                      child: Visibility(
                                        visible: false,
                                        child: TextField(
                                          controller: TextEditingController()
                                            ..text = user.name,
                                          decoration: InputDecoration(
                                            fillColor: Colors.white,
                                            filled: true,
                                            labelText: 'Password'.tr(),
                                            labelStyle: TextStyle(
                                                fontSize: 16.0,
                                                color: Color(0xff00334a)),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  width: 2,
                                                  color: Color(0xff00334a)),
                                              borderRadius: BorderRadius.zero,
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  width: 2,
                                                  color: Color(0xff00334a)),
                                              borderRadius: BorderRadius.zero,
                                            ),
                                          ),
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          obscureText: true,
                                        ),
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
                                        controller: TextEditingController()
                                          ..text = user.nationalID,
                                        onChanged: (text) => user.nationalID = text,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          labelText: 'National ID'.tr(),
                                          labelStyle: TextStyle(
                                              fontSize: 16.0,
                                              color: Color(0xff00334a)),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 2,
                                                color: Color(0xff00334a)),
                                            borderRadius: BorderRadius.zero,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 2,
                                                color: Color(0xff00334a)),
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
                                        controller: TextEditingController()
                                          ..text = user.tagID,
                                        onChanged: (text) => user.tagID = text,
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          labelText: 'Tag ID'.tr(),
                                          labelStyle: TextStyle(
                                              fontSize: 16.0,
                                              color: Color(0xff00334a)),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 2,
                                                color: Color(0xff00334a)),
                                            borderRadius: BorderRadius.zero,
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                width: 2,
                                                color: Color(0xff00334a)),
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

                                    print('phone: ${user.phone}');
                                    context.read<AuthService>().updateUser(
                                          user: user,
                                          context: context,
                                        );
                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(
                                          left:
                                              width > 400 ? width * 0.20 : 100,
                                          right:
                                              width > 400 ? width * 0.20 : 100),
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: const Color(0xff00334a),
                                        borderRadius:
                                            BorderRadius.circular(28.0),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          print(user.phone);
                                          context
                                              .read<AuthService>()
                                              .updateUser(
                                                user: user,
                                                context: context,
                                              );
                                        },
                                        child: Center(
                                          child: Text(
                                            'Update'.tr(),
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 20,
                                              color: Color(0xffffffff),
                                              letterSpacing: 0.65,
                                              fontWeight: FontWeight.w700,
                                              height: 1.2307692307692308,
                                            ),
                                            textHeightBehavior:
                                                TextHeightBehavior(
                                                    applyHeightToFirstAscent:
                                                        false),
                                            softWrap: false,
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
