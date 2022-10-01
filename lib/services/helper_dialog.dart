// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  //show error dialog
  static void showErroDialog(
      {String title = 'Login error',
      String description = 'Incorrect email or password'}) {
    // Get.dialog(
    //   Dialog(
    //     child: Padding(
    //       padding: const EdgeInsets.all(16.0),
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           Text(
    //             title,
    //             style: TextStyle(
    //               fontSize: 25,
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //           Text(
    //             description ?? '',
    //             style: Get.textTheme.headline6,
    //           ),
    //           ElevatedButton(
    //             onPressed: () {
    //               if (Get.isDialogOpen!) Get.back();
    //             },
    //             child: Text('Okay'),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    Get.snackbar(
        backgroundColor: Color(0x4D9A7AB8),
        title,
        description,
        animationDuration: Duration(seconds: 2),
        isDismissible: true,
        titleText: Text(
          title,
          style: TextStyle(
            color: Color(0xFF8030D0),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        messageText: Text(
          description,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ));
  }

  static void showNetworkDialog(
      {String title = 'Connection Error',
      String description = 'Please check your connection'}) {
    // Get.dialog(
    //   Dialog(
    //     child: Padding(
    //       padding: const EdgeInsets.all(16.0),
    //       child: Column(
    //         mainAxisSize: MainAxisSize.min,
    //         children: [
    //           Text(
    //             title,
    //             style: TextStyle(
    //               fontSize: 25,
    //               fontWeight: FontWeight.bold,
    //             ),
    //           ),
    //           Text(
    //             description ?? '',
    //             style: Get.textTheme.headline6,
    //           ),
    //           ElevatedButton(
    //             onPressed: () {
    //               if (Get.isDialogOpen!) Get.back();
    //             },
    //             child: Text('Okay'),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    Get.snackbar(
        backgroundColor: Color(0x4D9A7AB8),
        title,
        description,
        animationDuration: Duration(seconds: 2),
        isDismissible: true,
        titleText: Text(
          title,
          style: TextStyle(
            color: Color(0xFF8030D0),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        messageText: Text(
          description,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ));
  }

  static void welcome() {
    Get.dialog(
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Dialog(
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Center(
                      child: Text(
                        "Another day to chase your dream",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();

                      // Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF8030D0),
                      ),
                      child: Center(
                        child: Text(
                          "Get Started",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.5),
                        ),
                      ),
                    ),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     if (Get.isDialogOpen!) Get.back();
                  //   },
                  //   child: Text('Okay'),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Username or email already Exist
  static void userEmailExistError(
      {String title = 'Matching details',
      String description = 'Username or Email already exist'}) {
    Get.snackbar(
      backgroundColor: Color(0x4D9A7AB8),
      title,
      description,
      animationDuration: Duration(seconds: 2),
      isDismissible: true,
      titleText: Text(
        title,
        style: TextStyle(
          color: Color(0xFF8030D0),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        description,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static void addTask(
      {String title = 'Success', String description = 'Task has been added'}) {
    Get.snackbar(
      backgroundColor: Color(0x4DA598B1),
      title,
      description,
      animationDuration: Duration(seconds: 2),
      isDismissible: true,
      titleText: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        description,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  static void addTaskErroe(
      {String title = 'Error', String description = 'An error has occured'}) {
    Get.snackbar(
      backgroundColor: Color(0x4DA598B1),
      title,
      description,
      animationDuration: Duration(seconds: 2),
      isDismissible: true,
      titleText: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        description,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

//After registration
  static void signUpSuccess(
      {String title = 'Registration Successful',
      String description = 'Proceed to login'}) {
    Get.snackbar(
      backgroundColor: Color(0x4D9A7AB8),
      title,
      description,
      animationDuration: Duration(seconds: 2),
      isDismissible: true,
      titleText: Text(
        title,
        style: TextStyle(
          color: Color(0xFF8030D0),
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        description,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

//Copy to clipboard
//After registration
  static void clipboardCopy(
      {String title = 'Successful',
      String description = 'Link copied to clipboard'}) {
    Get.snackbar(
      backgroundColor: Color(0x4D9A7AB8),
      title,
      description,
      animationDuration: Duration(seconds: 2),
      isDismissible: true,
      titleText: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        description,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

//Logout Error
  static void logoutError(
      {String title = 'Error logging out',
      String description = 'You are not logged in'}) {
    Get.snackbar(
      backgroundColor: Color(0x4D9A7AB8),
      title,
      description,
      animationDuration: Duration(seconds: 2),
      isDismissible: true,
      titleText: Text(
        title,
        style: TextStyle(
          color: Colors.red,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      messageText: Text(
        description,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  //show toast
  //show snack bar
  //show loading
  static void showLoading([String? message]) {
    Get.dialog(
      barrierDismissible: false,
      WillPopScope(
        onWillPop: () async => false,
        child: Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    color: Color(0xFFAB35BF),
                  ),
                  SizedBox(height: 8),
                  Text(message ?? 'Logging in...'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Adding task loading
  static void showShortening([String? message]) {
    Get.dialog(
      barrierDismissible: false,
      WillPopScope(
        onWillPop: () async => false,
        child: Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    color: Color(0xFFAB35BF),
                  ),
                  SizedBox(height: 8),
                  Text(message ?? 'Just a moment...'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Sign out
  static void showLoadingSignOut([String? message]) {
    Get.dialog(
      barrierDismissible: false,
      WillPopScope(
        onWillPop: () async => false,
        child: Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    color: Color(0xFFAB35BF),
                  ),
                  SizedBox(height: 8),
                  Text(message ?? 'Signing Out...'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  static void deletingUrl([String? message]) {
    Get.dialog(
      barrierDismissible: false,
      WillPopScope(
        onWillPop: () async => false,
        child: Dialog(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    color: Color(0xFFAB35BF),
                  ),
                  SizedBox(height: 8),
                  Text(message ?? 'Deleting history...'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //hide loading
  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }
}
