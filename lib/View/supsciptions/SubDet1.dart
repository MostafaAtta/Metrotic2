import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../firebase_auth.dart';
import '../../helper.dart';
import '../../widget/AppBar.dart';
import '../../widget/Expandable.dart';
import '../../widget/botom Bar.dart';

class SupDet1 extends StatefulWidget {
  const SupDet1({Key? key}) : super(key: key);

  @override
  _SupDet1State createState() => _SupDet1State();
}

class _SupDet1State extends State<SupDet1> {
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
        builder: (BuildContext context,
            AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          subscriptionsPrices = snapshot.data;
          return SafeArea(
            child: ListView(
              children: [
                AppBarr(text: ("Monthly".tr())),
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
                        price:
                            int.parse(subscriptionsPrices[0]["price"].toString()),
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
                        price:
                        int.parse(subscriptionsPrices[1]["price"].toString()),
                        context: context,
                        ticket: false,
                        subId: subscriptionsPrices[1]["subId"].toString());
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
                    context.read<AuthService>().checkTicket(
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
                    context.read<AuthService>().checkTicket(
                        noOfStations: '',
                        price:
                        int.parse(subscriptionsPrices[3]["price"].toString()),
                        context: context,
                        ticket: false,
                        subId: subscriptionsPrices[3]["subId"].toString());
                  },
                )
              ],
            ),
          );
        }
      ),
    );
  }

  //
  // void addSub(
  //     {required String destination,
  //     required int discount,
  //     required int order,
  //     required int price,
  //     required int tripPrice}) async {
  //   print(destination);
  //   CollectionReference monthlyReference = FirebaseFirestore.instance
  //       .collection('Subscriptions_prices')
  //       .doc('ZZ9xxdI0g0FkRbbnlvXl')
  //       .collection('Annually');
  //
  //   await monthlyReference.add({
  //     'destination': destination,
  //     'discount': discount,
  //     'order': order,
  //     'price': price,
  //     'tripPrice': tripPrice,
  //   });
  // }
}
