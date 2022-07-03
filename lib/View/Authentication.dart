import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test/View/HomScreen.dart';
import 'package:test/View/verification.dart';
import 'package:test/helper.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffF5F5F8),
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 350,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 7.0,
                    color: Colors.black12,
                    offset: Offset(0, 2),
                    spreadRadius: 5.0,
                  ),
                ],
                color: ColorsHelp.background,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)),
              ),
              child: Stack(
                children: [
                  Container(
                    height: 300,
                    child: Center(
                      child: Image(
                        image: AssetImage("assets/logo.png"),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: TabBar(
                      unselectedLabelColor: Colors.grey,
                      labelColor: Colors.white,
                      labelStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      tabs: [
                        Tab(
                          text: '        Login        '.tr(),
                        ),
                        Tab(
                          text: '       Sign-up       '.tr(),
                        ),
                      ],
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.label,

                      indicatorColor: ColorsHelp.backgroundG,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 40.0, right: 40.0, top: 60.0),
                        child: Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Email address".tr(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                                buildEmailField(TextInputType.emailAddress),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Password".tr(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                                buildPasswordField('Password'),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Forgot password?".tr(),
                                style: TextStyle(color: ColorsHelp.background),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: ColorsHelp.background,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              height: 60,
                              width: 314,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Home()));
                                },
                                child: Text(
                                  "Login".tr(),
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 40.0, right: 40.0, top: 10.0,bottom: 10),
                        child: ListView(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Name".tr(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                                buildEmailField(TextInputType.name),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Phone Number".tr(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                                buildEmailField(TextInputType.phone),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Email address".tr(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                                buildEmailField(TextInputType.emailAddress),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Password".tr(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                                buildPasswordField('Password'.tr()),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tag ID".tr(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                                buildEmailField(TextInputType.number),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "National ID".tr(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey),
                                ),
                                buildEmailField(TextInputType.number),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),

                            Container(
                              decoration: BoxDecoration(
                                color: ColorsHelp.background,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              height: 60,
                              width: 314,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Verification()));
                                },
                                child: Text(
                                  "Signup".tr(),
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Already have an account?'.tr(),
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    color: const Color(0xff00334a),
                                    height: 1.5714285714285714,
                                  ),
                                  textHeightBehavior:
                                  TextHeightBehavior(applyHeightToFirstAscent: false),
                                  softWrap: false,
                                ),
                                GestureDetector(
                                  onTap: (){
                                    _tabController!.animateTo(0,duration: Duration(seconds: 1),curve: Curves.ease);
                                  },
                                  child: Text(
                                    'Login'.tr(),

                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                      color:  ColorsHelp.backgroundG,
                                      fontWeight: FontWeight.w700,
                                      height: 1.5714285714285714,
                                    ),
                                    textHeightBehavior:
                                    TextHeightBehavior(applyHeightToFirstAscent: false),
                                    softWrap: false,
                                  ),

                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
                controller: _tabController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildPasswordField(String label) {
  return SizedBox(
    height: 60,
    child: TextFormField(
      autofocus: false,
      textCapitalization: TextCapitalization.none,
      key: ValueKey('password'),
      autocorrect: false,
      enableSuggestions: false,
      obscureText: true,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    ),
  );
}

Widget buildEmailField(TextInputType t) {
  return SizedBox(
    height: 60,
    child: TextFormField(
      autofocus: false,
      textCapitalization: TextCapitalization.none,
      autocorrect: false,
      enableSuggestions: false,
      keyboardType: t,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    ),
  );
}
