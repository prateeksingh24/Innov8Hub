class UserData {
  final int id;
  final String name;
  final String email;
  final String number;
  final String instituteName;
  final String instituteAddress;
  final String instituteLogo;
  final String signatureLogo;
  final String emailVerifiedAt;
  final String status;
  final String createdAt;
  final String updatedAt;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.number,
    required this.instituteName,
    required this.instituteAddress,
    required this.instituteLogo,
    required this.signatureLogo,
    required this.emailVerifiedAt,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      name: json['name']??'',
      email: json['email']??'',
      number: json['number']??'',
      instituteName: json['institute_name']??'',
      instituteAddress: json['institute_address']??'',
      instituteLogo: json['institute_logo']??'',
      signatureLogo: json['signature_logo']??'',
      emailVerifiedAt: json['email_verified_at']??'',
      status: json['status']??'',
      createdAt: json['created_at']??'',
      updatedAt: json['updated_at']??'',
    );
  }
}
