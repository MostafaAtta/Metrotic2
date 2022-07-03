import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/View/Profile2.dart';
import 'package:test/View/webScreens/edit_info_web.dart';
import 'package:test/View/webScreens/home_screen_web.dart';
import 'package:test/View/webScreens/profile_web.dart';
import 'package:test/View/webScreens/signin_web.dart';
import 'package:test/View/webScreens/signup_web.dart';
import 'package:test/View/supsciptions/TicketPrice.dart';
import 'package:test/View/webScreens/tickets_web.dart';
import 'Controller/PickImage.dart';
import 'View/Edit Information.dart';
import 'View/HomScreen.dart';
import 'View/SignIn.dart';
import 'View/SignUp.dart';
import 'View/reset_password.dart';
import 'View/splash.dart';
import 'View/verification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'View/webScreens/reset_password_web.dart';
import 'firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  /*runApp(

    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GetImage()),
        Provider<AuthService>(
          create: (_) => AuthService(FirebaseAuth.instance),
        ),
      ],
      child: MyApp(),
    ),
  );*/
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'assets/translate', // <-- change patch to your
      fallbackLocale: Locale('en', 'US'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GetImage()),
        Provider<AuthService>(
          create: (_) => AuthService(FirebaseAuth.instance),
        ),
      ],
      child: MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        debugShowCheckedModeBanner: false,
        title: 'MetroTic',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      initialRoute: '/',
      routes: {
      '/': (context) => Splash(),
      '/sign_in': (context) => kIsWeb? SignInWeb() : SignIn(),
      '/sign_up': (context) => kIsWeb? SignUpWeb() : SignUp(),
      '/home_screen': (context) =>kIsWeb? HomeScreenWeb() : Home() ,
      '/profile': (context) => kIsWeb? ProfileWeb() : Profile(),
      '/tickets': (context) => kIsWeb? TicketsWeb() : TicketPrice(),
      '/verification': (context) => Verification(),
      '/reset_password': (context) => kIsWeb? ResetPasswordWeb() : ResetPasswordScreen(),
      '/edit_profile': (context) =>  EditInfoWeb(),
      }
      ),
    );
  }
}