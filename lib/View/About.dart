import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../helper.dart';
import '../widget/AppBar.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarr(text: "About".tr()),
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Image.asset(
                  "assets/m.png",
                  height: 60,
                  width: 60,
                  filterQuality: FilterQuality.high,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                    ' The stations of metro rail\nand systematic.Only come\ntickets are allowed inside\n the stations.'
                        .tr(),
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 15,
                      color: ColorsHelp.background,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                    ),
                    maxLines: 10,
                    textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                    overflow: TextOverflow.visible),
              ],
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
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Image.asset(
                  "assets/web.png",
                  height: 60,
                  width: 60,
                  filterQuality: FilterQuality.high,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'www.Metrotic.com',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    color: ColorsHelp.background,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
              ],
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
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.email,
                  color: ColorsHelp.background,
                  size: 40,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  'info@Metrotic.com',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    color: ColorsHelp.background,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
              ],
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
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Image.asset(
                  "assets/fac.png",
                  height: 60,
                  width: 60,
                  filterQuality: FilterQuality.high,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  '@Metrotic',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    color: ColorsHelp.background,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
              ],
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
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Image.asset(
                  "assets/inst.png",
                  height: 60,
                  width: 60,
                  filterQuality: FilterQuality.high,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  '@Metrotic',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    color: ColorsHelp.background,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                  textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                  softWrap: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
