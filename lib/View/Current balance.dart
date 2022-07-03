import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/View/addNewPaymnent.dart';
import 'package:test/View/rechargeBalance.dart';

import '../firebase_auth.dart';
import '../helper.dart';
import '../models/wallet.dart';
import '../widget/AppBar.dart';
import '../widget/botom Bar.dart';

class CurrentBalance extends StatefulWidget {
  const CurrentBalance({Key? key}) : super(key: key);

  @override
  _CurrentBalanceState createState() => _CurrentBalanceState();
}

class _CurrentBalanceState extends State<CurrentBalance> {

  late Wallet wallet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BotoomBar(
          index: 1,
        ),
        body: SafeArea(
            child: ListView(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppBarr(text: "Current Balance".tr()),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 200,
                    width: 300,
                    decoration: BoxDecoration(
                        color: ColorsHelp.background,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(1, 3),
                              blurRadius: 3,
                              color: Colors.grey)
                        ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.account_balance_wallet_rounded,
                              color: Colors.white,
                              size: 50,
                            ),
                            Text(
                              'Total wallet balance'.tr(),
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w500,
                                height: 1.5,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        FutureBuilder(
                          future: context.read<AuthService>().getBalance(),
                          builder: (BuildContext context,
                              AsyncSnapshot<dynamic> snapshot) {
                            if (!snapshot.hasData) return Container();

                            wallet = snapshot.data;

                            return Text(
                              '${wallet.balance} LE',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 40,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                              ),
                              textHeightBehavior:
                              TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
                            );
                          },

                        ),
                        Container(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (_) => RechargeBalance()));
                                },
                                child: Text(
                                  'Recharge'.tr(),
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  // Text(
                  //   'Payment Method',
                  //   style: TextStyle(
                  //     fontFamily: 'Montserrat',
                  //     fontSize: 18,
                  //     color: ColorsHelp.background,
                  //     fontWeight: FontWeight.w500,
                  //     height: 1.5,
                  //   ),
                  //   textHeightBehavior:
                  //       TextHeightBehavior(applyHeightToFirstAscent: false),
                  //   softWrap: false,
                  // ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  // Container(
                  //   padding: EdgeInsets.only(left: 10),
                  //   height: 80,
                  //   width: 300,
                  //   decoration: BoxDecoration(
                  //       color: ColorsHelp.background,
                  //       borderRadius: BorderRadius.circular(25),
                  //       boxShadow: [
                  //         BoxShadow(
                  //             offset: Offset(1, 3),
                  //             blurRadius: 3,
                  //             color: Colors.grey)
                  //       ]),
                  //   child: Row(
                  //     children: [
                  //       Image.asset("assets/visa.png"),
                  //       SizedBox(
                  //         width: 10,
                  //       ),
                  //       Text(
                  //         '1233 4583 5453 5453',
                  //         style: TextStyle(
                  //           fontFamily: 'Montserrat',
                  //           fontSize: 18,
                  //           color: Colors.white,
                  //           fontWeight: FontWeight.w500,
                  //           height: 1.5,
                  //         ),
                  //         textHeightBehavior:
                  //             TextHeightBehavior(applyHeightToFirstAscent: false),
                  //         softWrap: false,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Navigator.push(context,
                  //         MaterialPageRoute(builder: (_) => AddNewPayment()));
                  //   },
                  //   child: Text(
                  //     'Add New',
                  //     style: TextStyle(
                  //       fontFamily: 'Montserrat',
                  //       fontSize: 18,
                  //       color: Colors.green,
                  //       fontWeight: FontWeight.w500,
                  //       height: 1.5,
                  //     ),
                  //     textHeightBehavior:
                  //         TextHeightBehavior(applyHeightToFirstAscent: false),
                  //     softWrap: false,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  // Divider(
                  //   color: ColorsHelp.background,
                  //   thickness: 2,
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  /*Text(
                    'Last Translations',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                      color: ColorsHelp.background,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    ),
                    textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                    softWrap: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      padding: EdgeInsets.only(left: 10),
                      height: 80,
                      width: 300,
                      decoration: BoxDecoration(
                          color: ColorsHelp.background,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(1, 3),
                                blurRadius: 3,
                                color: Colors.grey)
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/tick.png"),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'From Helwan to Ell_oba',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5,
                                ),
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                softWrap: false,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '10 LE',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 18,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w500,
                                  height: 1.5,
                                ),
                                textHeightBehavior: TextHeightBehavior(
                                    applyHeightToFirstAscent: false),
                                softWrap: false,
                              ),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          )
                        ],
                      )),
                  SizedBox(
                    height: 10,
                  ),*/
                ],
              ),
            ])));
  }

}
