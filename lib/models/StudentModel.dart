/// success : true
/// data : [{"id":12,"user_id":"2","student_name":"Xyz","father_name":"Abc","mother_name":"Addf","date_of_birth":"12/12/2023","gender":"Male","aadhar":"102301020312","caste":"xx","whatsapp_number":"123456789","phone_number":"2313739276","address":"apsnbuhsiuhn","school_name":"ygybsudbshyd","roll_number":"32443432","standard":"csdnsdjbnciu","logo":null,"created_at":"2023-10-22T07:10:40.000000Z","updated_at":"2023-10-22T07:10:40.000000Z"}]

class StudentModel {
  StudentModel({
    bool? success,
    List<Data>? data,
  }) {
    _success = success;
    _data = data;
  }

  StudentModel.fromJson(dynamic json) {
    _success = json['success'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  bool? _success;
  List<Data>? _data;

  StudentModel copyWith({
    bool? success,
    List<Data>? data,
  }) =>
      StudentModel(
        success: success ?? _success,
        data: data ?? _data,
      );

  bool? get success => _success;

  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 12
/// user_id : "2"
/// student_name : "Xyz"
/// father_name : "Abc"
/// mother_name : "Addf"
/// date_of_birth : "12/12/2023"
/// gender : "Male"
/// aadhar : "102301020312"
/// caste : "xx"
/// whatsapp_number : "123456789"
/// phone_number : "2313739276"
/// address : "apsnbuhsiuhn"
/// school_name : "ygybsudbshyd"
/// roll_number : "32443432"
/// standard : "csdnsdjbnciu"
/// logo : null
/// created_at : "2023-10-22T07:10:40.000000Z"
/// updated_at : "2023-10-22T07:10:40.000000Z"

class Data {
  Data({
    num? id,
    String? userId,
    String? studentName,
    String? fatherName,
    String? motherName,
    String? dateOfBirth,
    String? gender,
    String? aadhar,
    String? caste,
    String? whatsappNumber,
    String? phoneNumber,
    String? address,
    String? schoolName,
    String? rollNumber,
    String? standard,
    dynamic logo,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _userId = userId;
    _studentName = studentName;
    _fatherName = fatherName;
    _motherName = motherName;
    _dateOfBirth = dateOfBirth;
    _gender = gender;
    _aadhar = aadhar;
    _caste = caste;
    _whatsappNumber = whatsappNumber;
    _phoneNumber = phoneNumber;
    _address = address;
    _schoolName = schoolName;
    _rollNumber = rollNumber;
    _standard = standard;
    _logo = logo;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _studentName = json['student_name'];
    _fatherName = json['father_name'];
    _motherName = json['mother_name'];
    _dateOfBirth = json['date_of_birth'];
    _gender = json['gender'];
    _aadhar = json['aadhar'];
    _caste = json['caste'];
    _whatsappNumber = json['whatsapp_number'];
    _phoneNumber = json['phone_number'];
    _address = json['address'];
    _schoolName = json['school_name'];
    _rollNumber = json['roll_number'];
    _standard = json['standard'];
    _logo = json['logo'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  num? _id;
  String? _userId;
  String? _studentName;
  String? _fatherName;
  String? _motherName;
  String? _dateOfBirth;
  String? _gender;
  String? _aadhar;
  String? _caste;
  String? _whatsappNumber;
  String? _phoneNumber;
  String? _address;
  String? _schoolName;
  String? _rollNumber;
  String? _standard;
  dynamic _logo;
  String? _createdAt;
  String? _updatedAt;

  Data copyWith({
    num? id,
    String? userId,
    String? studentName,
    String? fatherName,
    String? motherName,
    String? dateOfBirth,
    String? gender,
    String? aadhar,
    String? caste,
    String? whatsappNumber,
    String? phoneNumber,
    String? address,
    String? schoolName,
    String? rollNumber,
    String? standard,
    dynamic logo,
    String? createdAt,
    String? updatedAt,
  }) =>
      Data(
        id: id ?? _id,
        userId: userId ?? _userId,
        studentName: studentName ?? _studentName,
        fatherName: fatherName ?? _fatherName,
        motherName: motherName ?? _motherName,
        dateOfBirth: dateOfBirth ?? _dateOfBirth,
        gender: gender ?? _gender,
        aadhar: aadhar ?? _aadhar,
        caste: caste ?? _caste,
        whatsappNumber: whatsappNumber ?? _whatsappNumber,
        phoneNumber: phoneNumber ?? _phoneNumber,
        address: address ?? _address,
        schoolName: schoolName ?? _schoolName,
        rollNumber: rollNumber ?? _rollNumber,
        standard: standard ?? _standard,
        logo: logo ?? _logo,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  num? get id => _id;

  String? get userId => _userId;

  String? get studentName => _studentName;

  String? get fatherName => _fatherName;

  String? get motherName => _motherName;

  String? get dateOfBirth => _dateOfBirth;

  String? get gender => _gender;

  String? get aadhar => _aadhar;

  String? get caste => _caste;

  String? get whatsappNumber => _whatsappNumber;

  String? get phoneNumber => _phoneNumber;

  String? get address => _address;

  String? get schoolName => _schoolName;

  String? get rollNumber => _rollNumber;

  String? get standard => _standard;

  dynamic get logo => _logo;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['student_name'] = _studentName;
    map['father_name'] = _fatherName;
    map['mother_name'] = _motherName;
    map['date_of_birth'] = _dateOfBirth;
    map['gender'] = _gender;
    map['aadhar'] = _aadhar;
    map['caste'] = _caste;
    map['whatsapp_number'] = _whatsappNumber;
    map['phone_number'] = _phoneNumber;
    map['address'] = _address;
    map['school_name'] = _schoolName;
    map['roll_number'] = _rollNumber;
    map['standard'] = _standard;
    map['logo'] = _logo;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
