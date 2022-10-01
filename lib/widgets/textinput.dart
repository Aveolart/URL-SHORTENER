// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class InputForm extends StatefulWidget {
  final String label;
  final validator;
  final controller;
  // var? obScure;
  InputForm({
    Key? key,
    required this.label,
    required this.validator,
    required this.controller,
  }) : super(key: key);

  @override
  State<InputForm> createState() => _InputFormState();
}

class _InputFormState extends State<InputForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: TextFormField(
              validator: widget.validator,
              // obscureText: widget.obScure,
              cursorColor: Color(0xFFAB35BF),
              controller: widget.controller,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10, right: 10),
                fillColor: Color(0xFFECE6F3),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InputFormPass extends StatefulWidget {
  final String label;
  final validator;
  final controller;
  InputFormPass({
    Key? key,
    required this.label,
    required this.validator,
    required this.controller,
  }) : super(key: key);

  @override
  State<InputFormPass> createState() => _InputFormPassState();
}

class _InputFormPassState extends State<InputFormPass> {
  bool notVisible = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Container(
            margin: EdgeInsets.only(top: 8),
            child: TextFormField(
              validator: widget.validator,
              obscureText: notVisible,
              cursorColor: Color(0xFFAB35BF),
              controller: widget.controller,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        notVisible = !notVisible;
                      });
                    },
                    child: Icon(
                      Icons.visibility,
                      color: Color(0xFFAB35BF),
                    )),
                contentPadding: EdgeInsets.only(left: 10, right: 10),
                fillColor: Color(0xFFECE6F3),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6.0),
                  borderSide: BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
