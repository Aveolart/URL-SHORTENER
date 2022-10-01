import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:short_it/models/Delete/delete_model.dart';
import 'package:short_it/services/helper_dialog.dart';

import '../models/AllUrl/all_url_model.dart';
import '../models/LoginModel/login_response.dart';
import '../models/Logout/logout_model.dart';
import '../models/shortenedModel/shortened.dart';
import '../models/signupModel/signup_get_response.dart';

class ApiCalls {
  Future signUp(String email, String username, String password,
      String passwordConfirm) async {
    try {
      final url = Uri.parse(
          "https://sidehustle-url-shortener.herokuapp.com/api/v1/users/signup");
      final response = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            "email": email,
            "userName": username,
            "password": password,
            "passwordConfirm": passwordConfirm
          }));
      if (response.statusCode == 200) {
        Get.back();
        // print("Registration Complete");
        DialogHelper.signUpSuccess();
        var body = jsonDecode(response.body);
        return SignupGetResponse.fromJson(body);
      } else if (response.statusCode == 500) {
        Get.back();
        // print(response.statusCode);
        return DialogHelper.userEmailExistError();
      } else {
        Get.back();
        // print(response.statusCode);
      }
      return response.statusCode;
    } catch (e) {
      // print(e.toString());
    }
  }

  Future login(String emailAddress, String password) async {
    try {
      var url = Uri.parse(
          "https://sidehustle-url-shortener.herokuapp.com/api/v1/users/login");
      var response = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode({"email": emailAddress, "password": password}));
      if (response.statusCode == 200) {
        var nbody = jsonDecode(response.body);
        // print(nbody);
        return LoginResponseModel.fromJson(nbody);
      } else {
        // Map error = jsonDecode(response.body);
        // print(response.statusCode);
        Get.back();
        // print(response.statusCode);
        return DialogHelper.showErroDialog();
        // print("The error is " + error["message"]);
      }
    } catch (e) {
      Get.back();
      // print(e);
      return DialogHelper.showNetworkDialog();
      // print("internet");

    }
    // return response.statusCode;
  }

  Future shortenUrl(String fullUrl, String? token) async {
    try {
      var url = Uri.parse(
          "https://sidehustle-url-shortener.herokuapp.com/api/v1/url/shortenUrl");
      var response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: json.encode({"fullUrl": fullUrl}));
      if (response.statusCode == 200) {
        var nbody = jsonDecode(response.body);
        // print(nbody);
        return ShortenedModel.fromJson(nbody);
      } else if (response.statusCode == 201) {
        var nbody = jsonDecode(response.body);
        // print(nbody);
        return ShortenedModel.fromJson(nbody);
      } else {
        // Map error = jsonDecode(response.body);
        // print(response.statusCode);
        // print(jsonDecode(response.body));
        Get.back();
        return DialogHelper.addTaskErroe();
        // print("The error is " + error["message"]);
      }
    } catch (e) {
      Get.back();
      // print(e);
      return DialogHelper.showNetworkDialog();
      // print("internet");

    }
    // return response.statusCode;
  }

  //Delete Url
  Future deleteUrl(String? token, String? id) async {
    try {
      var url = Uri.parse(
          "https://sidehustle-url-shortener.herokuapp.com/api/v1/url/$id");
      var response = await http.delete(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });
      if (response.statusCode == 200) {
        var nbody = jsonDecode(response.body);
        // print(nbody);
        return DeleteModel.fromJson(nbody);
      } else if (response.statusCode == 201) {
        var nbody = jsonDecode(response.body);
        // print(nbody);
        return DeleteModel.fromJson(nbody);
      } else {
        // Map error = jsonDecode(response.body);
        // print(response.statusCode);
        // print(jsonDecode(response.body));
        Get.back();
        return DialogHelper.addTaskErroe();
        // print("The error is " + error["message"]);
      }
    } catch (e) {
      Get.back();
      // print(e);
      return DialogHelper.showNetworkDialog();
      // print("internet");

    }
    // return response.statusCode;
  }

  //Get Url Api
  Future<AllUrlModel?> getAllUrl(String? token) async {
    try {
      final url = Uri.parse(
          "https://sidehustle-url-shortener.herokuapp.com/api/v1/url/");
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      // print(response.statusCode);
      if (response.statusCode == 200) {
        var successful = jsonDecode(response.body);
        // print(successful);
        return AllUrlModel.fromJson(successful);
      } else {
        DialogHelper.logoutError();
      }
      // print(res["message"]);
      // return EmailHistoryResponse.fromJson(res);
      // }
    } on SocketException {
      throw "No internet connection";
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future signOut(String? token) async {
    try {
      // final token =
      //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzMmVlZmQ5MDAwYWYyMDAyMzMzZWRjZCIsImlhdCI6MTY2NDA3MTM3MiwiZXhwIjoxNjY0MTU3NzcyfQ.IiSWY2QRh778SaV7GCCbdv8zq8o11O4MslwuL5BA7W8";
      final url = Uri.parse(
          "https://sidehustle-url-shortener.herokuapp.com/api/v1/users/logout");
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      // print(response.statusCode);
      if (response.statusCode == 200) {
        var successful = jsonDecode(response.body);
        // print(successful);
        return LogOut.fromJson(successful);
      } else {
        DialogHelper.logoutError();
      }
      // var res = jsonDecode(response.body);
      // print(res["message"]);
      // return EmailHistoryResponse.fromJson(res);
      // }
    } on SocketException {
      throw "No internet connection";
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
