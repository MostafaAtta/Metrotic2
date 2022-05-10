import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/AppBar.dart';

class AddNewPayment extends StatefulWidget {
  const AddNewPayment({Key? key}) : super(key: key);

  @override
  State<AddNewPayment> createState() => _AddNewPaymentState();
}

class _AddNewPaymentState extends State<AddNewPayment> {
  final TextEditingController cardNoController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                          "Add New Card",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black),
                        ),
                        Icon(Icons.close),
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
                          labelText: "Card number",
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
                                  labelText: "Expiry Date",
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
                          labelText: "Cardholder name",
                          hintText: "Enter cardholder's full name",),
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
                        onPressed: () {},
                        child: Text("Add Card")),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
