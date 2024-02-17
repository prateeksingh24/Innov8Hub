class ALlStudentsModel {
  bool success;
  List<Student> data;

  ALlStudentsModel({
    required this.success,
    required this.data,
  });

  factory ALlStudentsModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> data = json['data'];
    List<Student> students = data.map((student) => Student.fromJson(student)).toList();

    return ALlStudentsModel(
      success: json['success'],
      data: students,
    );
  }
}
class Student {
  final int id;
  final String userId;
  final String studentName;
  final String fatherName;
  final String motherName;
  final String dateOfBirth;
  final String gender;
  final String aadhar;
  final String caste;
  final String whatsappNumber;
  final String phoneNumber;
  final String address;
  final String schoolName;
  final String rollNumber;
  final String standard;
  final String? logo;
  final String createdAt;
  final String updatedAt;

  Student({
    required this.id,
    required this.userId,
    required this.studentName,
    required this.fatherName,
    required this.motherName,
    required this.dateOfBirth,
    required this.gender,
    required this.aadhar,
    required this.caste,
    required this.whatsappNumber,
    required this.phoneNumber,
    required this.address,
    required this.schoolName,
    required this.rollNumber,
    required this.standard,
    required this.logo,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      userId: json['user_id']??'',
      studentName: json['student_name']??'',
      fatherName: json['father_name']??'',
      motherName: json['mother_name']??'',
      dateOfBirth: json['date_of_birth']??'',
      gender: json['gender']??'',
      aadhar: json['aadhar']??'',
      caste: json['caste']??'',
      whatsappNumber: json['whatsapp_number']??'',
      phoneNumber: json['phone_number']??'',
      address: json['address']??'',
      schoolName: json['school_name']??'',
      rollNumber: json['roll_number']??'',
      standard: json['standard']??'',
      logo: json['logo']??'',
      createdAt: json['created_at']??'',
      updatedAt: json['updated_at']??'',
    );
  }
}

