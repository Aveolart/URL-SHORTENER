// To parse this JSON data, do
//
//     final signupPost = signupPostFromJson(jsonString);

import 'dart:convert';

class SignupPost {
  SignupPost({
    required this.fullName,
    required this.userName,
    required this.email,
    required this.gender,
    required this.password,
    required this.passwordConfirm,
  });

  String fullName;
  String userName;
  String email;
  String gender;
  String password;
  String passwordConfirm;

  factory SignupPost.fromRawJson(String str) =>
      SignupPost.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SignupPost.fromJson(Map<String, dynamic> json) => SignupPost(
        fullName: json["fullName"],
        userName: json["userName"],
        email: json["email"],
        gender: json["gender"],
        password: json["password"],
        passwordConfirm: json["passwordConfirm"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "userName": userName,
        "email": email,
        "gender": gender,
        "password": password,
        "passwordConfirm": passwordConfirm,
      };
}
