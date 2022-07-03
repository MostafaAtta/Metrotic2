import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/View/webScreens/profile_web.dart';
import 'package:test/View/webScreens/tickets_web.dart';

import '../../firebase_auth.dart';
import '../SignIn.dart';
import 'home_screen_web.dart';

class MenuWeb extends StatefulWidget {
  const MenuWeb({Key? key}) : super(key: key);

  @override
  State<MenuWeb> createState() => _MenuWebState();
}

class _MenuWebState extends State<MenuWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        color: const Color(0xff19475b),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage('images/logo.png'),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(HomeScreenWeb.routeName);
              },
              child: Row(
                children: [
                  Image(
                    image: AssetImage('images/home.png'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Main page',
                    style: TextStyle(
                      fontSize: 35,
                      color: Color(0xffffffff),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(ProfileWeb.routeName);
              },
              child: Row(
                children: [
                  Image(
                    image: AssetImage('images/user.png'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'User profile'.tr(),
                    style: TextStyle(
                      fontSize: 35,
                      color: Color(0xffffffff),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(TicketsWeb.routeName);
              },
              child: Row(
                children: [
                  Image(
                    image: AssetImage('images/price.png'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Ticket prices'.tr(),
                    style: TextStyle(
                      fontSize: 35,
                      color: Color(0xffffffff),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.bottomLeft,
              child: IconButton(
                icon: Image.asset('images/signout.png'),
                iconSize: 50,
                onPressed: () async {
                  await context.read<AuthService>().signOut();
                  Navigator.of(context).pushReplacementNamed(SignIn.routeName);
                },
              ),
            )),
          ],
        ),
      ),
    );
  }
}
