class AdminProfileModel {
  final int id;
  final String adminId;
  final String mobile;
  final String email;
  final String password;
  final String adminName;

  AdminProfileModel({
    required this.id,
    required this.adminId,
    required this.mobile,
    required this.email,
    required this.password,
    required this.adminName,
  });

  factory AdminProfileModel.fromJson(Map<String, dynamic> json) {
    return AdminProfileModel(
      id: json['Id'] ?? 0,
      adminId: json['AdminId'] ?? '',
      mobile: json['Mobile'] ?? '',
      email: json['Email'] ?? '',
      password: json['Password'] ?? '',
      adminName: json['AdminName'] ?? '',
    );
  }
}
