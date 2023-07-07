import 'dart:convert';

import 'package:ecommerce/model/api/model/request/login/login_request.dart';
import 'package:ecommerce/model/api/model/request/register/register_request.dart';
import 'package:ecommerce/model/api/model/response/login/loginr_response.dart';
import 'package:ecommerce/model/api/model/response/register/register_response.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static Future<RegisterResponse> register(String name, String email,
      String password, String rePassword, String phone) async {
    var requestBody = RegisterRequest(
        name: name,
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone);
    var url = Uri.https(ApiConstants.baseUrl, ApiConstants.register);
    var response = await http.post(url, body: requestBody.toJson());
    return RegisterResponse.fromJson(jsonDecode(response.body));
  }

  static Future<LoginResponse> login(String email, String password) async {
    var requestBody = LoginRequest(
      email: email,
      password: password,
    );
    var url = Uri.https(ApiConstants.baseUrl, ApiConstants.login);
    var response = await http.post(url, body: requestBody.toJson());
    return LoginResponse.fromJson(jsonDecode(response.body));
  }
}

class ApiConstants {
  static const baseUrl = 'route-ecommerce.onrender.com';
  static const register = 'api/v1/auth/signup';
  static const login = 'api/v1/auth/signin';
}
