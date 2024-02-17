import 'dart:convert';

import 'package:demo_ui/models/AddStudentModel.dart';
import 'package:demo_ui/models/StudentModel.dart';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;

import '../models/SignInModel.dart';
import '../models/SignUpModel.dart';
//Sign In
class SignInApi {
  String? _token;
  String responseBody = '';
  Future<SignInModel?> loginMod(String email, String password) async {
    try {
      var url = Uri.parse("https://apilomda.fitowiki.com/api/login");
      var response = await http.post(url, body: {
        "email": email,
        "password": password,
      });
      if (response.statusCode == 200) {
        responseBody = response.body;

        final data = json.decode(responseBody);
        final status = data['status'];
        final token = data['token'];
        // print(token);
        if (status == true){
          _token = token;
          SignInModel model = SignInModel.fromJson(jsonDecode(response.body));
          return model;
        }
        else {
          throw Exception('Failed to sign in');
        }
      }
      else{
        throw Exception('Failed to sign in');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
  String? getToken() {
    return _token;
  }
}
//SignUp
class SignUpApi {
  Future<SignUpModel?> signMod(String email, String password,String name,String number,String passwordConfirmation) async {
    try {
      var url = Uri.parse("https://apilomda.fitowiki.com/api/register");
      var response = await http.post(url, body: {
        "email": email,
        "password": password,
        "name":name,
        "number":number,
        "password_confirmation":passwordConfirmation
      });
      if (response.statusCode == 200) {

          SignUpModel model = SignUpModel.fromJson(jsonDecode(response.body));
          return model;
      }
      else{
        throw Exception('Failed to sign up');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}


class AddStudentFormApi {

  final authService = SignInApi();
  Future<AddStudentModel?> addStudent1(
      String studentName,
      String fatherName,
      String motherName,
      String dateOfBirth,
      String gender,
      String aadhar,
      String caste,
      String whatsappNumber,
      String phoneNumber,
      String address,
      String schoolName,
      String rollNumber,
      String standard,
      String authToken, // Pass your authentication token here
      ) async {
    try {
      final token = authService.getToken();
      if (kDebugMode) {
        print(token);
      }
      var url = Uri.parse("https://apilomda.fitowiki.com/api/register");
      var headers = <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token', // Use your authentication token here
      };

      var response = await http.post(
        url,
        headers: headers, // Include the headers in the request
        body: {
          "student_name": studentName,
          "father_name": fatherName,
          "mother_name": motherName,
          "date_of_birth": dateOfBirth,
          "gender": gender,
          "aadhar": aadhar,
          "caste": caste,
          "whatsapp_number": whatsappNumber,
          "phone_number": phoneNumber,
          "address": address,
          "school_name": schoolName,
          "roll_number": rollNumber,
          "standard": standard,
        },
      );

      if (response.statusCode == 200) {
        AddStudentModel model = AddStudentModel.fromJson(jsonDecode(response.body));
        return model;
      } else {
        throw Exception('Failed to sign up');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}




//Add Student



















//
// void main() async {
//   final authService = AuthenticationService();
//
//   try {
//     // Log in and store the token
//     await authService.login('user@example.com', 'password');
//
//     // Access the stored token
//     final token = authService.getToken();
//     if (token != null) {
//       print('Token: $token');
//
//       // You can now use the token in other API calls
//       // Example: call another API with the token
//       // final response = await http.get(
//       //   Uri.parse('https://your-api-endpoint.com'),
//       //   headers: {
//       //     'Authorization': 'Bearer $token',
//       //   },
//       // );
//
//       // Handle the response as needed
//     } else {
//       print('Token not available');
//     }
//   } catch (e) {
//     print('Login error: $e');
//   }
// }





//All Student Display


class DisplayStudent {
  Future<StudentModel?> fetchStudent() async {
    final response =
    await http.get(Uri.parse('https://apilomda.fitowiki.com/api/student/'));

    if (response.statusCode == 200) {
      return StudentModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load student data');
    }
  }
}
