import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import 'AppBar.dart';

class MapMetro extends StatelessWidget {
  const MapMetro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          AppBarr(text: "Metro Map".tr()),
          SizedBox(
            height: 50,
          ),
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height - 100,
            child: PhotoView(
              backgroundDecoration: BoxDecoration(color: Colors.white),
              imageProvider: AssetImage(
                "assets/metroo.png",
              ),
            ),
          )
        ],
      ),
    ));
  }
}
