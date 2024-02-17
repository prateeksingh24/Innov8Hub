class BatchModel {
  final int id;
  final String userId;
  final String batchName;
  final String feeType;
  final String feeAmount;
  final String? logo;
  final String createdAt;
  final String updatedAt;

  BatchModel({
    required this.id,
    required this.userId,
    required this.batchName,
    required this.feeType,
    required this.feeAmount,
    this.logo,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BatchModel.fromJson(Map<String, dynamic> json) {
    return BatchModel(
      id: json['id'],
      userId: json['user_id'] ?? '',
      batchName: json['batch_name'] ?? '',
      feeType: json['fee_type'] ?? '',
      feeAmount: json['fee_amount'] ?? '',
      logo: json['logo'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}
