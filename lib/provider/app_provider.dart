import 'package:demo_ui/models/ExamModel.dart';
import 'package:demo_ui/models/students_model.dart';
import 'package:demo_ui/services/remote/app_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/batch_model.dart';

class AppProvider extends ChangeNotifier {
  List<Student> students = [];
  List<BatchModel> batches = [];
  Map<String, dynamic> examsMap = {};
  bool studentsCalled = false;
  bool batchesCalled = false;
  bool examCalled = false;


  Future<bool?> addStudent({
    required String userId,
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
    context,
  }) async {
    await AppServices.addStudent(
      userId: userId,
      studentName: studentName,
      fatherName: fatherName,
      motherName: motherName,
      dateOfBirth: dateOfBirth,
      gender: gender,
      aadhar: aadhar,
      caste: caste,
      whatsappNumber: whatsappNumber,
      phoneNumber: phoneNumber,
      address: address,
      schoolName: schoolName,
      rollNumber: rollNumber,
      standard: standard,
      logo: logo,
      context: context,
    ).then((value) {
      return value;
    });
    notifyListeners();
    return null;
  }

  Future<Student?> getStudents() async {
    if (!studentsCalled) {
      await AppServices.getStudents().then((value) {
        students = value;
        if (kDebugMode) {
          print(students.length.toString());
        }
        notifyListeners();
        studentsCalled = true;
        return students;
      });
    }
    return null;
  }

  Future<bool?> addBatch({
    required String userId,
    required String batchName,
    required String feeType,
    required String feeAmount,
    required String logo,
    context,
  }) async {
    await AppServices.addBatch(
      userId: userId,
      batchName: batchName,
      feeType: feeType,
      feeAmount: feeAmount,
      logo: logo,
      context: context,
    ).then((value) {
      return value;
    });
    notifyListeners();
    return null;
  }

  Future<BatchModel?> getBatches() async {
    if (!batchesCalled) {
      await AppServices.getBatches().then((value) {
        batches = value;
        if (kDebugMode) {
          print(batches.length.toString());
        }
        notifyListeners();
        batchesCalled = true;
        return batches;
      });
    }
    return null;
  }

  Future<bool?> addExam({
    required String userId,
    required String batchId,
    required String examTopic,
    required String exMaxMarks,
    required String examDate,
    context,
  }) async {
    await AppServices.addExam(
      userId: userId,
      batchId: batchId,
      examTopic: examTopic,
      exMaxMarks: exMaxMarks,
      examDate: examDate,
      context: context,
    ).then((value) {
      return value;
    });
    notifyListeners();
    return null;
  }

  Future<ExamModel?> getExam() async {
    if (!examCalled) {
      await AppServices.getExams().then((value) {
        examsMap = value;
        if (kDebugMode) {
          print(examsMap.length.toString());
        }
        notifyListeners();
        examCalled = true;
        return examsMap;
      });
    }
    return null;
  }
}
