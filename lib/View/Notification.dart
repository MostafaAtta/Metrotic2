import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:test/widget/notification_widget.dart';

import '../firebase_auth.dart';
import '../helper.dart';
import '../widget/botom Bar.dart';
import 'menu.dart';

class Notif extends StatelessWidget {
  final bool? isBooking;
  final bool? isExpired;
  final bool? isPurchased;
  final bool? isLogin;
  final bool? isReserved;

  Notif({
    this.isBooking = false,
    this.isExpired = false,
    this.isPurchased = false,
    this.isLogin = false,
    this.isReserved = false,
  });

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> notifications = <Map<String, Object>>[];
    return Scaffold(
        bottomNavigationBar: BotoomBar(
          index: 4,
        ),
        body: SafeArea(
          child: ListView(children: [
            Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.green,
                            size: 30,
                          )),
                      Text(
                        "Notification".tr(),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: ColorsHelp.background),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => Menu()));
                        },
                        child: Image.asset(
                          "assets/menu.png",
                          width: 30,
                          height: 30,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  )
                ],
              ),
            ),
            FutureBuilder(
                future: context.read<AuthService>().getNotifications(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (!snapshot.hasData)
                    return Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator());

                  notifications = snapshot.data;
                  return Container(
                      padding: EdgeInsets.all(16),
                      height: MediaQuery.of(context).size.height - 200,
                      decoration: BoxDecoration(
                        color: const Color(0xff00334a),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: ListView.builder(
                          itemCount: notifications.length,
                          itemBuilder: (BuildContext cxt, int i) {
                            return NotificationWidget(
                                title: notifications[i]['title'] as String,
                                body: notifications[i]['body'] as String);
                          }));
                }),
          ]),
        ));
  }
}
