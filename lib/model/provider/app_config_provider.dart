import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String? token;
  void setToken(String ?token) {
    this.token = token;
  }
}
