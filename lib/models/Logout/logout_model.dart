// To parse this JSON data, do
//
//     final logOut = logOutFromJson(jsonString);

import 'dart:convert';

class LogOut {
  LogOut({
    required this.status,
    required this.message,
  });

  String status;
  String message;

  factory LogOut.fromRawJson(String str) => LogOut.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LogOut.fromJson(Map<String, dynamic> json) => LogOut(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
