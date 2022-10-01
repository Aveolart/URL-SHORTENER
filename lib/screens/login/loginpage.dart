// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:short_it/models/LoginModel/login_response.dart';
import 'package:short_it/screens/homepage.dart';
import 'package:short_it/screens/login/sign_up.dart';
import 'package:short_it/services/api_service.dart';
import 'package:short_it/services/helper_dialog.dart';
import 'package:short_it/widgets/buttons.dart';
import 'package:short_it/widgets/textinput.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

LoginResponseModel? data;
var tok = "";

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();
  // final lpasswordController = TextEditingController();

  final services = ApiCalls();

  bool checked = false;

  requestLogin(String emailCont, String passwordCont) async {
    data = await services.login(emailCont, passwordCont);
    if (data != null) {
      setState(() {
        tok = data!.token;
      });
      // print(data?.token);
      // print(tok);

      Get.offAll(() => Homepage());
      return tok;
      // Get.off(Mainpage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.only(left: 25, right: 25),
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 60),
                  child: Text(
                    "SHORT IT!",
                    style: TextStyle(
                      fontFamily: 'Valera',
                      fontSize: 32,   
                      fontWeight: FontWeight.w800,
                      color: Color(0xFFAB35BF),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    "URL SHORTENER",
                    style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFFAB35BF),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        "Email Address",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null) return 'Field cannot be empty';

                            if (value.isEmpty) return 'Field cannot be empty';

                            bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value);

                            return !emailValid
                                ? 'Enter a Valid Email Address'
                                : null;
                          },
                          controller: _emailController,
                          cursorColor: Color(0xFFAB35BF),
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 10, right: 10),
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
                      SizedBox(
                        height: 20,
                      ),
                      InputFormPass(
                        label: "Password",
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null) {
                            return "Please enter your password";
                          }
                          if (value.isEmpty) {
                            return "Please enter your password";
                          }
                          if (value.length < 8) {
                            return "Password length too short";
                          }
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 22, bottom: 40),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  checked = !checked;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                width: 23,
                                height: 23,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Color(0xFFECE6F3),
                                  border: Border.all(
                                    width: 1.3,
                                    color: Color(0xFFAB35BF),
                                  ),
                                ),
                                child: checked
                                    ? Icon(
                                        size: 15,
                                        Icons.check,
                                        color: Color(0xFFAB35BF),
                                      )
                                    : null,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Text(
                                "Remember me",
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),
                            ),
                            Expanded(child: Container()),
                            // Text(
                            //   "Forgot Password?",
                            //   style: TextStyle(
                            //     fontWeight: FontWeight.w500,
                            //     fontSize: 14,
                            //     color: Color(0xFF8030D0),
                            //   ),
                            // )
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 10, right: 10),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Flexible(
                      //         child: Container(
                      //           height: 1,
                      //           color: Color(0xFF1C316C),
                      //         ),
                      //       ),
                      //       Padding(
                      //         padding:
                      //             const EdgeInsets.only(left: 20, right: 20),
                      //         child: Text(
                      //           "or",
                      //           style: TextStyle(
                      //               color: Color(0xFF1C316C),
                      //               fontWeight: FontWeight.w400,
                      //               fontSize: 16),
                      //         ),
                      //       ),
                      //       Flexible(
                      //         child: Container(
                      //           height: 1,
                      //           color: Color(0xFF16163F),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 5, bottom: 5),
                          width: 60,
                          height: 60,
                          // decoration: BoxDecoration(
                          //   color: Colors.white,
                          //   boxShadow: [
                          //     BoxShadow(
                          //       blurRadius: 10,
                          //       spreadRadius: 2,
                          //       color: Colors.grey.shade300,
                          //     ),
                          //   ],
                          //   border: Border.all(
                          //     width: 1,
                          //     color: Color(0xFF1C316C),
                          //   ),
                          //   borderRadius: BorderRadius.circular(30),
                          // ),
                          // child: Center(
                          //   child: Image.asset(
                          //       width: 50,
                          //       height: 50,
                          //       "assets/google-logo-png-29546.png"),
                          // ),
                        ),
                      ),
                      InkWell(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              debugPrint("Correct details");
                              DialogHelper.showLoading();
                              debugPrint('loading');
                              await requestLogin(_emailController.text,
                                  _passwordController.text);

                              // Navigator.pop(context);
                              // setState(() {
                              //   // _emailController.dispose();
                              //   // _passwordController.dispose();
                              // });
                            }
                          },
                          child: PurpleLargeButton(text: "Log in")),
                      Container(
                        padding: EdgeInsets.only(top: 25),
                        child: InkWell(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => SignUpScreen(),
                            //   ),
                            // );
                            Get.to(() => SignUpScreen(),
                                transition: Transition.cupertino);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?  ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(0xFF16163F)),
                              ),
                              Text(
                                "Sign up",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color(0xFFAB35BF),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
