// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:short_it/models/signupModel/signup_get_response.dart';
import 'package:short_it/screens/login/loginpage.dart';
import 'package:short_it/services/api_service.dart';
import 'package:short_it/services/helper_dialog.dart';
import 'package:short_it/widgets/buttons.dart';
import 'package:short_it/widgets/textinput.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  static final emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswwordCont = TextEditingController();

  final signupCall = ApiCalls();

  static var genderRadioBtnVal = "Male";
  final styles = TextStyle(fontSize: 16, fontWeight: FontWeight.w400);

  SignupGetResponse? signUpData;

  bool checked = false;

  requestSignUp() async {
    signUpData = await signupCall.signUp(
        emailController.text,
        _usernameController.text,
        _passwordController.text,
        _confirmPasswwordCont.text);
    if (signUpData != null) {
      Get.off(() => LoginPage());
      return signUpData;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
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
                        height: 30,
                      ),
                      InputForm(
                        label: "Email Address",
                        validator: (value) {
                          // if (value == null) return 'Email cannot be empty';

                          if (value.isEmpty) {
                            return 'Email cannot be empty';
                          }
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value);

                          return !emailValid
                              ? 'Enter a Valid Email Address'
                              : null;
                        },
                        controller: emailController,
                      ),
                      InputForm(
                        label: "Username",
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Username cannot be empty';
                          } else if (value.length < 3) {
                            return 'Username cannot be less than 3';
                          }
                        },
                        controller: _usernameController,
                      ),
                      InputFormPass(
                        label: "Password",
                        validator: (value) {
                          if (value == null) {
                            return "Enter your password";
                          } else if (value.length < 5) {
                            return "Password is minumum of 8 characters";
                          }
                        },
                        controller: _passwordController,
                      ),
                      InputFormPass(
                        label: "Confirm Password",
                        controller: _confirmPasswwordCont,
                        validator: (value) {
                          if (value == null) {
                            return "Confirm your password";
                          } else if (value.isEmpty) {
                            return 'Field cannot be empty';
                          } else if (value != _passwordController.text) {
                            return "Password doesn't match";
                          }
                        },
                      ),
                      InkWell(
                          onTap: () async {
                            if (_formKey.currentState!.validate() &&
                                genderRadioBtnVal.toString() != "Null") {
                              debugPrint("Valid");
                              DialogHelper.showLoading("Signing up");
                              await requestSignUp();
                              debugPrint(signUpData?.status);
                            }
                          },
                          child: SignUpButton()),
                      Container(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: InkWell(
                          onTap: () {
                            // Get.to(() => LoginPage(),
                            //     transition: Transition.cupertino);
                            Get.back();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?  ",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(0xFF16163F)),
                              ),
                              Text(
                                "Log in",
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
            ),
          ),
        ),
      ),
    );
  }
}
