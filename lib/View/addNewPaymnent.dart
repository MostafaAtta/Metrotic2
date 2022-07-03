import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/View/rechargeBalance.dart';

import '../firebase_auth.dart';
import '../models/user.dart';
import '../widget/AppBar.dart';

class AddNewPayment extends StatefulWidget {
  const AddNewPayment({Key? key}) : super(key: key);

  @override
  State<AddNewPayment> createState() => _AddNewPaymentState();
}

class _AddNewPaymentState extends State<AddNewPayment> {
  String uid = "";
  final TextEditingController cardNoController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: context.read<AuthService>().getLocalUser(),
          builder: (BuildContext context,
              AsyncSnapshot<dynamic> snapshot) {
            if (!snapshot.hasData) return Container();

            uid = (snapshot.data as User).uid;
          return SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  margin: EdgeInsets.all(8.0),
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.white)),
                  elevation: 10,
                  child: Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Add New Card".tr(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black),
                            ),
                            IconButton(icon: Icon(Icons.close), onPressed: () {
                              Navigator.pop(context, MaterialPageRoute(builder: (_) => RechargeBalance()));

                            },),
                          ],
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        TextField(
                          controller: cardNoController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0))),
                              labelText: "Card number".tr(),
                              hintText: "0000 0000 0000 0000",
                              suffixIcon: Icon(Icons.credit_card)),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 4.0),
                                child: TextField(
                                  controller: expiryDateController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0))),
                                      labelText: "Expiry Date".tr(),
                                      hintText: "MM/YY",
                                      suffixIcon: Icon(Icons.calendar_month_sharp)),
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: TextField(
                                  controller: cvvController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.0))),
                                      labelText: "CVC/CVV",
                                      hintText: "***",
                                      suffixIcon: Icon(Icons.info_rounded)),
                                  keyboardType: TextInputType.text,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0))),
                            labelText: "Cardholder name".tr(),
                            hintText: "Enter cardholder's full name".tr(),
                          ),
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size.fromHeight(
                                  40), // fromHeight use double.infinity as width and 40 is the height
                            ),
                            onPressed: () {
                              context.read<AuthService>().addCard(
                                  uid: uid,
                                  cardNumber: cardNoController.text.trim(),
                                  expiryDate: expiryDateController.text.trim(),
                                  name: nameController.text.trim(),
                                  context: context);
                            },
                            child: Text("Add Card".tr())),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }

}
