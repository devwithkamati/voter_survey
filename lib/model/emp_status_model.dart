class UpdateEmployeeStatusRequest {
  final int employeeId;
  final bool isActive;

  UpdateEmployeeStatusRequest({
    required this.employeeId,
    required this.isActive,
  });

  Map<String, dynamic> toJson() {
    return {"employeeId": employeeId, "isActive": isActive};
  }
}

class UpdateEmployeeStatusResponse {
  bool? status;
  String? message;
  int? employeeId;
  bool? currentStatus;

  UpdateEmployeeStatusResponse({
    this.status,
    this.message,
    this.employeeId,
    this.currentStatus,
  });

  factory UpdateEmployeeStatusResponse.fromJson(Map<String, dynamic> json) {
    return UpdateEmployeeStatusResponse(
      status: json["Status"],
      message: json["Message"],
      employeeId: json["EmployeeId"],
      currentStatus: json["CurrentStatus"],
    );
  }
}
