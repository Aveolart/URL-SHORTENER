// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({Key? key}) : super(key: key);

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  static var genderRadioBtnVal;
  final styles = TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Gender",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Row(
              children: [
                SizedBox(
                  height: 18,
                  width: 18,
                  child: Radio<String>(
                    // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    activeColor: Color(0xFF8030D0),
                    value: "Male",
                    groupValue: genderRadioBtnVal,
                    onChanged: _handleGenderChange,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Male",
                    style: styles,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                SizedBox(
                  height: 18,
                  width: 18,
                  child: Radio<String>(
                    activeColor: Color(0xFF8030D0),
                    value: "Female",
                    groupValue: genderRadioBtnVal,
                    onChanged: _handleGenderChange,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Female",
                    style: styles,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                SizedBox(
                  height: 18,
                  width: 18,
                  child: Radio<String>(
                    activeColor: Color(0xFF8030D0),
                    value: "Others",
                    groupValue: genderRadioBtnVal,
                    onChanged: _handleGenderChange,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Others",
                    style: styles,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleGenderChange(String? value) {
    setState(() {
      genderRadioBtnVal = value;
      debugPrint(genderRadioBtnVal.toString());
    });
  }
}
