import 'package:ecommerce/model/provider/app_config_provider.dart';
import 'package:ecommerce/model/ui/home/home_screen.dart';
import 'package:ecommerce/model/ui/login/login_screen.dart';
import 'package:ecommerce/my_theme.dart';
import 'package:ecommerce/model/ui/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => AppConfigProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        LoginScreen.screeenName: (context) => const LoginScreen(),
        SignUpScreen.screenName: (context) => const SignUpScreen(),
        HomeScreen.screenName: (context) => const HomeScreen(),
      },
      initialRoute: LoginScreen.screeenName,
      theme: MyTheme.myTheme,
    );
  }
}
