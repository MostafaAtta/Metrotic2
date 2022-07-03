import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../firebase_auth.dart';
import '../../models/wallet.dart';
import 'header.dart';
import 'menu_web.dart';

class HomeScreenWeb extends StatefulWidget {
  const HomeScreenWeb({
    Key? key,
  }) : super(key: key);

  static const routeName = "/home_screen";

  @override
  State<HomeScreenWeb> createState() => _HomeScreenWebState();
}

class _HomeScreenWebState extends State<HomeScreenWeb> {

  late Wallet wallet;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            const Expanded(flex: 3, child: MenuWeb()),
            Expanded(
              flex: 12,
              child: Column(
                children: [
                  Expanded(flex: 1, child: Header(title: 'Home Screen'.tr())),
                  Expanded(
                    flex: 12,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 80,
                          ),
                          Expanded(
                            flex: 1,
                            child: FittedBox(
                              fit: BoxFit.fitHeight,
                              child: Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: const Color(0xff00334a),
                                  borderRadius: BorderRadius.circular(19.0),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x29000000),
                                      offset: Offset(0, 3),
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image(
                                          image:
                                              AssetImage('images/wallet.png'),
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          'Wallet balance'.tr(),
                                          style: TextStyle(
                                            fontFamily: 'Hacen Promoter Md',
                                            fontSize: 30,
                                            color: Color(0xffffffff),
                                            height: 0.8,
                                          ),
                                          textHeightBehavior:
                                              TextHeightBehavior(
                                                  applyHeightToFirstAscent:
                                                      false),
                                          softWrap: false,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    FutureBuilder(
                                        future: context
                                            .read<AuthService>()
                                            .getBalance(),
                                        builder: (BuildContext context,
                                            AsyncSnapshot<dynamic> snapshot) {
                                          if (!snapshot.hasData)
                                            return CircularProgressIndicator();

                                          wallet = snapshot.data;

                                          return Text(
                                            '${wallet.balance} LE',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 53,
                                              color: Color(0xff00da82),
                                              fontWeight: FontWeight.w700,
                                              height: 1.6037735849056605,
                                            ),
                                            textHeightBehavior:
                                                TextHeightBehavior(
                                                    applyHeightToFirstAscent:
                                                        false),
                                            softWrap: false,
                                          );
                                        }),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Image(
                                    image: AssetImage('images/metro_map.png'),
                                    fit: BoxFit.fill),
                                SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  'Metro Map'.tr(),
                                  style: TextStyle(
                                    fontFamily: 'Hacen Promoter Md',
                                    fontSize: 47,
                                    color: const Color(0xff00334a),
                                    height: 1.0851063829787233,
                                  ),
                                  textHeightBehavior: TextHeightBehavior(
                                      applyHeightToFirstAscent: false),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 80,
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
      ),
    );
  }
}
