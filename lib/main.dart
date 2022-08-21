import 'package:email_management/screens/home.dart';
import 'package:email_management/screens/login_screen.dart';
import 'package:email_management/screens/splash_screen.dart';
import 'package:email_management/screens/user_profile.dart';
import 'package:email_management/service/app_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // this line must put at any api or await
  WidgetsFlutterBinding.ensureInitialized();
  AppService.prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "myMail",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.grey,
          textTheme: TextTheme(),
          scaffoldBackgroundColor: Colors.white),
      home: LoginPage()
            // SplashScreen(),
    );
  }
}
