import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/View/webScreens/ticket_widget.dart';

import '../../firebase_auth.dart';
import 'header.dart';
import 'menu_web.dart';

class TicketsWeb extends StatefulWidget {
  static const routeName = "/tickets";

  const TicketsWeb({
    Key? key,
  }) : super(key: key);

  @override
  State<TicketsWeb> createState() => _TicketsWebState();
}

class _TicketsWebState extends State<TicketsWeb> {
  List<Map<String, Object>> ticketPrices = <Map<String, Object>>[];

  @override
  Widget build(BuildContext context) {
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
                              title: 'Tickets'.tr(),
                            )),
                        FutureBuilder(
                            future: context.read<AuthService>().getTicketPrices(),
                            builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          if (!snapshot.hasData)
                            return Expanded(
                              flex: 12,
                              child: Align(
                                  alignment: Alignment.center,
                                  child: CircularProgressIndicator()),
                            );

                          ticketPrices = snapshot.data;
                          return Expanded(
                            flex: 12,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: ticketPrices.map((e) {
                                  return TicketWidget(
                                      noOfStations: e["noOfStations"] as String,
                                      price: e["price"] as int,
                                      name: e["name"] as String);
                                }).toList(),
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
