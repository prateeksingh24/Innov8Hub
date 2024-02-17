import 'dart:convert';
import 'package:demo_ui/constants.dart';
import 'package:demo_ui/models/students_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../models/user_model.dart';
import '../local/cache_helper.dart';

class AuthEndpoints {
  static const String baseUrl = "https://cashcrack.online/api/";
  static const String login = "${baseUrl}login";
  static const String signup = "${baseUrl}register";
  static const String user = "${baseUrl}user";
}

class AuthServices {
  static Future<bool> signup({
    required String name,
    required String email,
    required String number,
    required String password,
    required String passwordConfirmation,
  }) async {
    var headers = {'Accept': 'application/json'};
    var request =
        http.MultipartRequest('POST', Uri.parse(AuthEndpoints.signup));
    request.fields.addAll({
      'name': name,
      'email': email,
      'number': number,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'institute_address': '',
      'institute_name': '',
      'institute_logo': '',
      'signature_logo': ''
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return true;
    } else {
      if (kDebugMode) {
        print(response.reasonPhrase);
      }
      return false;
    }
  }

  static Future<bool> signin({
    required String email,
    required String password,
  }) async {
    var headers = {
      'Accept': 'application/json',
    };
    var request = http.MultipartRequest('POST', Uri.parse(AuthEndpoints.login));
    request.fields.addAll({'email': email, 'password': password});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonResponse = await response.stream.bytesToString();
      Map<String, dynamic> jsonMap = json.decode(jsonResponse);
      token = jsonMap["token"];
      CacheHelper.save(key: 'token', value: token);
      if (kDebugMode) {
        print(token);
      }

      return true;
    } else {
      if (kDebugMode) {
        print(response.reasonPhrase);
      }
      return false;
    }
  }

  static Future<UserData> getUserData() async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.Request('GET', Uri.parse(AuthEndpoints.user));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonResponse = await response.stream.bytesToString();
      Map<String, dynamic> jsonMap = json.decode(jsonResponse);
      UserData userData = UserData.fromJson(jsonMap['data']);
      return userData;
    } else {
      return Future.error('Error: ${response.reasonPhrase}');
    }
  }
}
