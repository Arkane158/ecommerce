/// email : "mohosni158@gmail.com"

class ForgotPasswordRequest {
  ForgotPasswordRequest({
      this.email,});

  ForgotPasswordRequest.fromJson(dynamic json) {
    email = json['email'];
  }
  String? email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    return map;
  }

}