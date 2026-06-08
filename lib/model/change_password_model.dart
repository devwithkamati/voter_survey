class ChangePasswordRequest {
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;
  final int adminId;

  ChangePasswordRequest({
    required this.oldPassword,
    required this.newPassword,
    required this.confirmPassword,
    required this.adminId,
  });

  Map<String, String> toMap() {
    return {
      "OldPassword": oldPassword,
      "NewPassword": newPassword,
      "ConfirmPassword": confirmPassword,
      "AdminID": adminId.toString(),
    };
  }
}

class ChangePasswordResponse {
  final bool status;
  final String message;

  ChangePasswordResponse({required this.status, required this.message});

  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) {
    return ChangePasswordResponse(
      status: json["Status"] ?? false,
      message: json["Message"] ?? "",
    );
  }
}
