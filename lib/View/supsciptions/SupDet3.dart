import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../firebase_auth.dart';
import '../../helper.dart';
import '../../widget/AppBar.dart';
import '../../widget/Expandable.dart';
import '../../widget/botom Bar.dart';

class SupDet3 extends StatefulWidget {
  const SupDet3({Key? key}) : super(key: key);

  @override
  _SupDet3State createState() => _SupDet3State();
}

class _SupDet3State extends State<SupDet3> {
  List<Map<String, Object>> subscriptionsPrices = <Map<String, Object>>[];

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: BotoomBar(
        index: 1,
      ),
      body: FutureBuilder(
          future: context.read<AuthService>().getSubscriptions(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (!snapshot.hasData)
              return Center(child: CircularProgressIndicator());

            subscriptionsPrices = snapshot.data;
            return SafeArea(
              child: ListView(
                children: [
                  AppBarr(text: ("Yearly".tr())),
                  SizedBox(
                    height: 40,
                  ),
                  Expandables(
                    price: subscriptionsPrices.isNotEmpty
                        ? subscriptionsPrices[0]["price"].toString()
                        : "",
                    destination: subscriptionsPrices.isNotEmpty
                        ? subscriptionsPrices[0]["destination"].toString()
                        : "",
                    tripPrice: subscriptionsPrices.isNotEmpty
                        ? subscriptionsPrices[0]["tripPrice"].toString()
                        : "",
                    discountPercentage: subscriptionsPrices.isNotEmpty
                        ? subscriptionsPrices[0]["discount"].toString()
                        : "",
                    onPressed: () {
                      context.read<AuthService>().checkTicket(
                          noOfStations: '',
                          price: int.parse(
                              subscriptionsPrices[0]["price"].toString()),
                          context: context,
                          ticket: false,
                          subId: subscriptionsPrices[0]["subId"].toString());
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    thickness: 1,
                    color: ColorsHelp.background,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Expandables(
                    price: subscriptionsPrices.isNotEmpty
                        ? subscriptionsPrices[1]["price"].toString()
                        : "",
                    destination: subscriptionsPrices.isNotEmpty
                        ? subscriptionsPrices[1]["destination"].toString()
                        : "",
                    tripPrice: subscriptionsPrices.isNotEmpty
                        ? subscriptionsPrices[1]["tripPrice"].toString()
                        : "",
                    discountPercentage: subscriptionsPrices.isNotEmpty
                        ? subscriptionsPrices[1]["discount"].toString()
                        : "",
                    onPressed: () {
                      context.read<AuthService>().checkTicket(
                          noOfStations: '',
                          price: int.parse(
                              subscriptionsPrices[1]["price"].toString()),
                          context: context,
                          ticket: false,
                          subId: subscriptionsPrices[1]["subId"].toString());
                    },
                  ),
                  /*SizedBox(
                  height: 20,
                ),
                Divider(
                  thickness: 1,
                  color: ColorsHelp.background,
                ),
                SizedBox(
                  height: 20,
                ),
                Expandables(
                    price: subscriptionsPrices.isNotEmpty
                        ? subscriptionsPrices[2]["price"].toString()
                        : "",
                    destination: subscriptionsPrices.isNotEmpty
                        ? subscriptionsPrices[2]["destination"].toString()
                        : "",
                    tripPrice: subscriptionsPrices.isNotEmpty
                        ? subscriptionsPrices[2]["tripPrice"].toString()
                        : "",
                    discountPercentage: subscriptionsPrices.isNotEmpty
                        ? subscriptionsPrices[2]["discount"].toString()
                        : "",
                  onPressed: () {
                    context.read<AuthService>().checkWallet(
                        uid: uid,
                        noOfStations: '',
                        price:
                        int.parse(subscriptionsPrices[2]["price"].toString()),
                        context: context,
                        ticket: false,
                        subId: subscriptionsPrices[2]["subId"].toString());
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  thickness: 1,
                  color: ColorsHelp.background,
                ),
                SizedBox(
                  height: 20,
                ),
                Expandables(
                    price: subscriptionsPrices.isNotEmpty
                        ? subscriptionsPrices[3]["price"].toString()
                        : "",
                    destination: subscriptionsPrices.isNotEmpty
                        ? subscriptionsPrices[3]["destination"].toString()
                        : "",
                    tripPrice: subscriptionsPrices.isNotEmpty
                        ? subscriptionsPrices[3]["tripPrice"].toString()
                        : "",
                    discountPercentage: subscriptionsPrices.isNotEmpty
                        ? subscriptionsPrices[3]["discount"].toString()
                        : "",
                  onPressed: () {
                    context.read<AuthService>().checkWallet(
                        uid: uid,
                        noOfStations: '',
                        price:
                        int.parse(subscriptionsPrices[3]["price"].toString()),
                        context: context,
                        ticket: false,
                        subId: subscriptionsPrices[3]["subId"].toString());
                  },
                )*/
                ],
              ),
            );
          }),
    );
  }
}
