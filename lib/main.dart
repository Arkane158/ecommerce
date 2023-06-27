import 'package:ecommerce/model/ui/login/login_screen.dart';
import 'package:ecommerce/model/ui/my_theme.dart';
import 'package:ecommerce/model/ui/register/register_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginScreen.screeenName: (context) => const LoginScreen(),
        RegisterScreen.screenName: (context) => RegisterScreen(),
      },
      initialRoute: RegisterScreen.screenName,
      theme: MyTheme.myTheme,
    );
  }
}
