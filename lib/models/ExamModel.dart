/// success : true
/// data : [{"id":1,"user_id":"1","batch_id":"1","exam_topic":"science","ex_max_marks":"500","exam_date":"2023-12-05 18:17:12","created_at":"2023-10-30T18:17:12.000000Z","updated_at":"2023-10-30T18:17:12.000000Z"},{"id":2,"user_id":"1","batch_id":"1","exam_topic":"hindi","ex_max_marks":"500","exam_date":"2023-12-05 18:17:33","created_at":"2023-10-30T18:17:33.000000Z","updated_at":"2023-10-30T18:17:33.000000Z"},{"id":3,"user_id":"1","batch_id":"1","exam_topic":"math","ex_max_marks":"200","exam_date":"2023-11-05 18:17:56","created_at":"2023-10-30T18:17:56.000000Z","updated_at":"2023-10-30T18:17:56.000000Z"},{"id":4,"user_id":"1","batch_id":"1","exam_topic":"No Toppic","ex_max_marks":"100","exam_date":"2024-01-01 11:37:57","created_at":"2023-11-02T11:37:57.000000Z","updated_at":"2023-11-02T11:37:57.000000Z"}]

class ExamModel {
  ExamModel({
      bool? success, 
      List<Data>? data,}){
    _success = success;
    _data = data;
}

  ExamModel.fromJson(dynamic json) {
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
ExamModel copyWith({  bool? success,
  List<Data>? data,
}) => ExamModel(  success: success ?? _success,
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

/// id : 1
/// user_id : "1"
/// batch_id : "1"
/// exam_topic : "science"
/// ex_max_marks : "500"
/// exam_date : "2023-12-05 18:17:12"
/// created_at : "2023-10-30T18:17:12.000000Z"
/// updated_at : "2023-10-30T18:17:12.000000Z"

class Data {
  Data({
      num? id, 
      String? userId, 
      String? batchId, 
      String? examTopic, 
      String? exMaxMarks, 
      String? examDate, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _userId = userId;
    _batchId = batchId;
    _examTopic = examTopic;
    _exMaxMarks = exMaxMarks;
    _examDate = examDate;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _batchId = json['batch_id'];
    _examTopic = json['exam_topic'];
    _exMaxMarks = json['ex_max_marks'];
    _examDate = json['exam_date'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _userId;
  String? _batchId;
  String? _examTopic;
  String? _exMaxMarks;
  String? _examDate;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  num? id,
  String? userId,
  String? batchId,
  String? examTopic,
  String? exMaxMarks,
  String? examDate,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  userId: userId ?? _userId,
  batchId: batchId ?? _batchId,
  examTopic: examTopic ?? _examTopic,
  exMaxMarks: exMaxMarks ?? _exMaxMarks,
  examDate: examDate ?? _examDate,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get userId => _userId;
  String? get batchId => _batchId;
  String? get examTopic => _examTopic;
  String? get exMaxMarks => _exMaxMarks;
  String? get examDate => _examDate;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['batch_id'] = _batchId;
    map['exam_topic'] = _examTopic;
    map['ex_max_marks'] = _exMaxMarks;
    map['exam_date'] = _examDate;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}