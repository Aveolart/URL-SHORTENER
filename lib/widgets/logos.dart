// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ShareIcons extends StatelessWidget {
  final String icon;
  const ShareIcons({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      decoration: BoxDecoration(
          color: Color(0xFFAB35BF), borderRadius: BorderRadius.circular(10)),
      width: 55,
      height: 55,
      child: Image(
        // width: 40,
        image: AssetImage(icon),
      ),
    );
  }
}
