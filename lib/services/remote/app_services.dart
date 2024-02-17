import 'dart:convert';
import 'package:demo_ui/constants.dart';
import 'package:demo_ui/models/students_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../models/batch_model.dart';

class AppEndpoints {
  static const String baseUrl = "https://cashcrack.online/api/";
  static const String teacher = "${baseUrl}teacher";
  static const String addTeacher = "$teacher/add";
  static const String student = "${baseUrl}student";
  static const String addStudent = "$student/add";
  static const String batch = "${baseUrl}batch";
  static const String addBatch = "$batch/add";
  static const String exams = "${baseUrl}exam";
  static const String addExams = "$exams/add";
}

class AppServices {
  static Future<bool> addStudent(
      {required String userId,
      required String studentName,
      required String fatherName,
      required String motherName,
      required String dateOfBirth,
      required String gender,
      required String aadhar,
      required String caste,
      required String whatsappNumber,
      required String phoneNumber,
      required String address,
      required String schoolName,
      required String rollNumber,
      required String standard,
      required String logo,
      context}) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request =
        http.MultipartRequest('POST', Uri.parse(AppEndpoints.addStudent));
    request.fields.addAll({
      'user_id': userId,
      'student_name': studentName,
      'father_name': fatherName,
      'mother_name': motherName,
      'date_of_birth': dateOfBirth,
      'gender': gender,
      'aadhar': aadhar,
      'caste': caste,
      'whatsapp_number': whatsappNumber,
      'phone_number': phoneNumber,
      'address': address,
      'school_name': schoolName,
      'roll_number': rollNumber,
      'standard': standard,
      'logo': logo,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      SnackBar snackBar = SnackBar(
        content: Text(
          'Tutio \n$studentName added successfully',
        ),
        duration: const Duration(seconds: 3),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return true;
    } else {
      if (kDebugMode) {
        print(response.reasonPhrase);
      }
      return false;
    }
  }

  static Future<List<Student>> getStudents() async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.Request('GET', Uri.parse(AppEndpoints.student));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonResponse = await response.stream.bytesToString();
      Map<String, dynamic> jsonMap = json.decode(jsonResponse);

      if (kDebugMode) {
        print(jsonMap.toString());
      }

      List<Student> students = (jsonMap['data'] as List)
          .map((studentJson) => Student.fromJson(studentJson))
          .toList();
      if (kDebugMode) {
        print(students.length.toString());
      }
      return students;
    } else {
      Future.error(response.statusCode.toString());
      return Future.error('Failed to load students ');
    }
  }

  static Future<bool> addBatch(
      {required String userId,
      required String batchName,
      required String feeType,
      required String feeAmount,
      required String logo,
      context}) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request =
        http.MultipartRequest('POST', Uri.parse(AppEndpoints.addBatch));
    request.fields.addAll({
      'user_id': userId,
      'batch_name': batchName,
      'fee_type': feeType,
      'fee_amount': feeAmount,
      'logo': logo
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      SnackBar snackBar = SnackBar(
        content: Text(
          'Tutio \n$batchName added successfully',
        ),
        duration: const Duration(seconds: 3),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return true;
    } else {
      if (kDebugMode) {
        print(response.reasonPhrase);
      }
      return false;
    }
  }

  static Future<List<BatchModel>> getBatches() async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.Request('GET', Uri.parse(AppEndpoints.batch));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonResponse = await response.stream.bytesToString();
      Map<String, dynamic> jsonMap = json.decode(jsonResponse);

      if (kDebugMode) {
        print(jsonMap.toString());
      }

      List<BatchModel> batches = (jsonMap['data'] as List)
          .map((batch) => BatchModel.fromJson(batch))
          .toList();
      if (kDebugMode) {
        print(batches.length.toString());
      }
      return batches;
    } else {
      Future.error(response.statusCode.toString());
      return Future.error('Failed to load students ');
    }
  }

  static Future<bool> addTeacher(
      {required String userId,
      required String teacherName,
      required String joinDate,
      required String position,
      required String salaryType,
      required String salaryAmount,
      required String qualification,
      required String gender,
      required String whatsappNumber,
      required String phoneNumber,
      required String address,
      required String logo,
      required String studentName,
      context}) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request =
        http.MultipartRequest('POST', Uri.parse(AppEndpoints.addTeacher));
    request.fields.addAll({
      'user_id': userId,
      'teacher_name': teacherName,
      'join_date': joinDate,
      'position': position,
      'salary_type': salaryType,
      'gender': gender,
      'salary_amount': salaryAmount,
      'qualification': qualification,
      'whatsapp_number': whatsappNumber,
      'phone_number': phoneNumber,
      'address': address,
      'logo': logo,
      'student_name': studentName,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      SnackBar snackBar = SnackBar(
        content: Text(
          'Tutio \n$teacherName added successfully',
        ),
        duration: const Duration(seconds: 3),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return true;
    } else {
      if (kDebugMode) {
        print(response.reasonPhrase);
      }
      return false;
    }
  }

  static Future<void> getTeachers() async {
    //todo: need model but now still no data returned >>>> also add teacher method....

    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.Request('GET', Uri.parse(AppEndpoints.teacher));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonResponse = await response.stream.bytesToString();
      Map<String, dynamic> jsonMap = json.decode(jsonResponse);

      if (kDebugMode) {
        print(jsonMap.toString());
      }
    } else {
      Future.error(response.statusCode.toString());
      return Future.error('Failed to load students ');
    }
  }

  static Future<bool> addExam({
    required String userId,
    required String batchId,
    required String examTopic,
    required String exMaxMarks,
    required String examDate,
    context,
  }) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request =
        http.MultipartRequest('POST', Uri.parse(AppEndpoints.addExams));
    request.fields.addAll({
      'user_id': userId,
      'batch_id': batchId,
      'exam_topic': examTopic,
      'ex_max_marks': exMaxMarks,
      'exam_date': examDate,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      SnackBar snackBar = SnackBar(
        content: Text(
          'Tutio \n$examTopic Exam added successfully',
        ),
        duration: const Duration(seconds: 3),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      return true;
    } else {
      if (kDebugMode) {
        print(response.reasonPhrase);
      }
      return false;
    }
  }

  static Future<Map<String, dynamic>> getExams() async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
    var request = http.Request('GET', Uri.parse(AppEndpoints.exams));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var jsonResponse = await response.stream.bytesToString();
      Map<String, dynamic> jsonMap = json.decode(jsonResponse);

      if (kDebugMode) {
        print(jsonMap.toString());
      }
      return jsonMap;
    } else {
      Future.error(response.statusCode.toString());
      return Future.error('Failed to load students ');
    }
  }
}
