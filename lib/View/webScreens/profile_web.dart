import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/View/Edit%20Information.dart';
import 'package:test/View/webScreens/edit_info_web.dart';

import '../../firebase_auth.dart';
import '../../models/user.dart';
import 'header.dart';
import 'menu_web.dart';

class ProfileWeb extends StatefulWidget {
  static const routeName = "/profile";

  const ProfileWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileWeb> createState() => _ProfileWebState();
}

class _ProfileWebState extends State<ProfileWeb> {
  late User user;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
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
                        title: 'Profile'.tr(),
                      )),
                  FutureBuilder(
                      future: context.read<AuthService>().checkUserUpdates(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (!snapshot.hasData)
                          return Expanded(
                            flex: 12,
                            child: Align(
                                alignment: Alignment.center,
                                child: CircularProgressIndicator()),
                          );

                        user = snapshot.data;

                        return Expanded(
                          flex: 12,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 80,
                                ),
                                Row(
                                  children: [
                                    Image(
                                      image: AssetImage('images/person.png'),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      user.name,
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 29,
                                        color: const Color(0xff00334a),
                                        fontWeight: FontWeight.w500,
                                        height: 1.7586206896551724,
                                      ),
                                      textHeightBehavior: TextHeightBehavior(
                                          applyHeightToFirstAscent: false),
                                      textAlign: TextAlign.right,
                                      softWrap: false,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Image(
                                      image: AssetImage('images/phone.png'),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      user.phone,
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 29,
                                        color: const Color(0xff00334a),
                                        fontWeight: FontWeight.w500,
                                        height: 1.7586206896551724,
                                      ),
                                      textHeightBehavior: TextHeightBehavior(
                                          applyHeightToFirstAscent: false),
                                      textAlign: TextAlign.right,
                                      softWrap: false,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Image(
                                      image: AssetImage('images/mail.png'),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      user.email,
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 29,
                                        color: const Color(0xff00334a),
                                        fontWeight: FontWeight.w500,
                                        height: 1.7586206896551724,
                                      ),
                                      textHeightBehavior: TextHeightBehavior(
                                          applyHeightToFirstAscent: false),
                                      textAlign: TextAlign.right,
                                      softWrap: false,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Image(
                                      image: AssetImage('images/id_card.png'),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      user.nationalID,
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 29,
                                        color: const Color(0xff00334a),
                                        fontWeight: FontWeight.w500,
                                        height: 1.7586206896551724,
                                      ),
                                      textHeightBehavior: TextHeightBehavior(
                                          applyHeightToFirstAscent: false),
                                      textAlign: TextAlign.right,
                                      softWrap: false,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Image(
                                      image: AssetImage('images/microchip.png'),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      user.tagID,
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 29,
                                        color: const Color(0xff00334a),
                                        fontWeight: FontWeight.w500,
                                        height: 1.7586206896551724,
                                      ),
                                      textHeightBehavior: TextHeightBehavior(
                                          applyHeightToFirstAscent: false),
                                      textAlign: TextAlign.right,
                                      softWrap: false,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushReplacementNamed(
                                        EditInfoWeb.routeName);
                                  },
                                  child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Container(
                                        padding: const EdgeInsets.only(
                                            left: 16,
                                            right: 16,
                                            top: 8,
                                            bottom: 8),
                                        decoration: BoxDecoration(
                                          color: const Color(0xff00334a),
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                        ),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context)
                                                .pushReplacementNamed(
                                                    EditInfoWeb.routeName);
                                          },
                                          child: Center(
                                            child: Text(
                                              'Edit'.tr(),
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
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
