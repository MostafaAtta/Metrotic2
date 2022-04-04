import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Controller/PickImage.dart';
import 'View/splash.dart';

void main() {
  runApp(

    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GetImage()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Splash(),
    );
  }
}