class LoginModel {
  String? status;
  String? message;
  int? id;
  String? adminName;
  String? adminEmail;
  String? mobileNo;

  LoginModel({
    this.status,
    this.message,
    this.id,
    this.adminName,
    this.adminEmail,
    this.mobileNo,
  });

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    id = json['Id'];
    adminName = json['AdminName'];
    adminEmail = json['AdminEmail'];
    mobileNo = json['MobileNo'];
  }
}
