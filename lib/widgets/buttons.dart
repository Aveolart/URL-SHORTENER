// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PurpleLargeButton extends StatelessWidget {
  final String text;
  const PurpleLargeButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFFAB35BF),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 45),
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFFAB35BF),
      ),
      child: Center(
        child: Text(
          "Create an account",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.5),
        ),
      ),
    );
  }
}
