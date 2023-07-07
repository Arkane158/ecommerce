
import 'package:ecommerce/model/api/model/response/register/server_error.dart';

import 'user.dart';

/// data : {"name":"Ahmed Abd Al-Muti","email":"nabil1@route.com","phone":"01234567801","password":"$2a$12$Wp7A2bycw/orhD/vdlR9HeU3s0j7nNtdtidlLdOs4uRVwu5eDW3rm","role":"user","_id":"63cd78f9c57ec80280491b4d","createdAt":"2023-01-22T17:57:13.885Z","updatedAt":"2023-01-22T17:57:13.885Z","__v":0}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzY2Q3OGY5YzU3ZWM4MDI4MDQ5MWI0ZCIsImlhdCI6MTY3NDQxMDIzNCwiZXhwIjoxNjgyMTg2MjM0fQ.pLGWqqUNdYvAOj0NxrPcqX-NoNSjV32BoZieFPiSytc"

class RegisterResponse {
  RegisterResponse({
    this.user,
    this.token,
  });

  RegisterResponse.fromJson(dynamic json) {
    user = json['data'] != null ? User.fromJson(json['data']) : null;
    token = json['token'];
    if (json['errors'] != null) {
      errors = [];
      json['errors'].forEach((v) {
        errors?.add(ServerError.fromJson(v));
      });
    }
  }

  User? user;
  String? token;
  List<ServerError>? errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['data'] = user?.toJson();
    }
    if (errors != null) {
      map['errors'] = errors?.map((v) => v.toJson()).toList();
    }
    map['token'] = token;
    return map;
  }

  String mergeErrors() {
    String message = '';
    errors?.forEach((error) {
      message += '${error.msg ?? ''}\n';
    });
    return message;
  }
}
