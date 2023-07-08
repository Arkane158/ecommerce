class ResetCodeRequest {
  ResetCodeRequest({
      this.resetCode,});

  ResetCodeRequest.fromJson(dynamic json) {
    resetCode = json['resetCode'];
  }
  String? resetCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['resetCode'] = resetCode;
    return map;
  }

}