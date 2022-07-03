import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../firebase_auth.dart';
import '../../models/user.dart';

class Header extends StatelessWidget {
  String title;

  Header({Key? key, required this.title}) : super(key: key);

  late User user;

  @override
  Widget build(BuildContext context) {
    var provider = context.read<AuthService>();
    return Scaffold(
        body: FutureBuilder(
            future: provider.getLocalUser(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (!snapshot.hasData) return Container();

              user = snapshot.data;

              print(user.uid);

              return Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x29000000),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage('images/user.png'),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            user.name,
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 35,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Image(
                          image: AssetImage('images/facebook.png'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Image(
                          image: AssetImage('images/instagram.png'),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Image(
                          image: AssetImage('images/mail.png'),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }));
  }
}
