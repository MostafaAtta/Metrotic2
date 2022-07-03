import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../helper.dart';
class SelectStation extends StatelessWidget {


  final Function? Text1 ;
  final Function ?Text2 ;
  final Function? Location ;

  const SelectStation({Key? key, this.Text1, this.Text2, this.Location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: const Color(0xbfffffff),
        borderRadius: BorderRadius.circular(12.0),
        border:
        Border.all(width: 1.0, color: const Color(0xbf00334a)),
        boxShadow: [
          BoxShadow(
            color: const Color(0x1f000000),
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Column(
              children: [
                SizedBox(height: 7,),

                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      color: ColorsHelp.background,
                      borderRadius: BorderRadius.circular(20)),
                ),
                Container(
                  height: 5,
                  width: 2,
                  decoration: BoxDecoration(
                      color: ColorsHelp.background,
                      borderRadius: BorderRadius.circular(20)),
                ),
                Container(
                  height: 5,
                  width: 2,
                  decoration: BoxDecoration(
                      color: ColorsHelp.background,
                      borderRadius: BorderRadius.circular(20)),
                ),
                Container(
                  height: 5,
                  width: 2,
                  decoration: BoxDecoration(
                      color: ColorsHelp.background,
                      borderRadius: BorderRadius.circular(20)),
                ),
                Container(
                  height: 5,
                  width: 2,
                  decoration: BoxDecoration(
                      color: ColorsHelp.background,
                      borderRadius: BorderRadius.circular(20)),
                ),
                Container(
                  height: 5,
                  width: 2,
                  decoration: BoxDecoration(
                      color: ColorsHelp.background,
                      borderRadius: BorderRadius.circular(20)),
                ),
                Container(
                  height: 5,
                  width: 2,
                  decoration: BoxDecoration(
                      color: ColorsHelp.background,
                      borderRadius: BorderRadius.circular(20)),
                ),
                Container(
                  height: 5,
                  width: 2,
                  decoration: BoxDecoration(
                      color: ColorsHelp.background,
                      borderRadius: BorderRadius.circular(20)),
                ),
                Container(
                  height: 5,
                  width: 2,
                  decoration: BoxDecoration(
                      color: ColorsHelp.background,
                      borderRadius: BorderRadius.circular(20)),
                ),
                Container(
                  height: 5,
                  width: 2,
                  decoration: BoxDecoration(
                      color: ColorsHelp.background,
                      borderRadius: BorderRadius.circular(20)),
                ),
                Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      color: ColorsHelp.background,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    child: Text(
                      "From Station".tr(),
                      style:
                      TextStyle(color: ColorsHelp.background),
                    ),
                    onTap:Text1==null? (){}:Text1!(),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  IconButton(
                      onPressed:Location==null?(){}: Location!(),
                      icon: Icon(
                        Icons.my_location,
                        color: ColorsHelp.background,
                      ))
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: 250,
                        height: 3,
                        color: ColorsHelp.background,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      GestureDetector(
                        child: Text(
                          "To Station".tr(),
                          style: TextStyle(
                              color: ColorsHelp.background),
                        ),
                        onTap:Text2==null?(){}: Text2!(),
                      )
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
