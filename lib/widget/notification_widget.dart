import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  String title;
  String body;
  NotificationWidget({Key? key, required this.title, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_active,
                    color: Colors.green,
                    size: 40,
                  )),
              SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15,
                  color: const Color(0xffffffff),
                  fontWeight: FontWeight.w500,
                  height: 1.5294117647058822,
                ),
                textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                softWrap: false,
              )
            ],
          ),
          Text(
            body,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15,
              color: const Color(0xffffffff),
              fontWeight: FontWeight.w500,
              height: 1.5294117647058822,
            ),
            textHeightBehavior:
            TextHeightBehavior(applyHeightToFirstAscent: false),
            softWrap: false,
          ),

          Container(
            margin: EdgeInsets.all(8),
            height: 2,
            width: double.infinity,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
