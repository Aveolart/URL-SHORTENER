// To parse this JSON data, do
//
//     final loginError = loginErrorFromJson(jsonString);

import 'dart:convert';

class LoginError {
  LoginError({
    required this.status,
    required this.message,
  });

  String status;
  String message;

  factory LoginError.fromRawJson(String str) =>
      LoginError.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginError.fromJson(Map<String, dynamic> json) => LoginError(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
