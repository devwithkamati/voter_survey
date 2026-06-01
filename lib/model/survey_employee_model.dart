// class SurveyEmployeeModel {
//   bool? status;
//   int? totalSurveyEmp;
//   String? message;
//   List<EmployeeData>? data;
//
//   SurveyEmployeeModel({
//     this.status,
//     this.totalSurveyEmp,
//     this.message,
//     this.data,
//   });
//
//   SurveyEmployeeModel.fromJson(Map<String, dynamic> json) {
//     status = json['Status'];
//     totalSurveyEmp = json['TotalSurveyEmp'];
//     message = json['Message '];
//
//     if (json['Data'] != null) {
//       data = <EmployeeData>[];
//
//       json['Data'].forEach((v) {
//         data!.add(EmployeeData.fromJson(v));
//       });
//     }
//   }
// }
//
// class EmployeeData {
//   int? id;
//   String? fullName;
//   String? fatherName;
//   String? mobileNumber;
//   String? alternateNumber;
//   String? email;
//   String? address;
//   String? state;
//   String? district;
//   String? identityType;
//   String? aadhaarNumber;
//   String? voterID;
//   String? userImage;
//   String? assignedVillageId;
//   String? completedVilageName;
//   String? pendingVillageName;
//
//   EmployeeData.fromJson(Map<String, dynamic> json) {
//     id = json['Id'];
//     fullName = json['FullName'];
//     fatherName = json['FatherName'];
//     mobileNumber = json['MobileNumber'];
//     alternateNumber = json['AlternateNumber'];
//     email = json['Email'];
//     address = json['Address'];
//     state = json['State'];
//     district = json['District'];
//     identityType = json['IdentityType'];
//     aadhaarNumber = json['AadhaarNumber'];
//     voterID = json['VoterID'];
//     userImage = json['UserImage'];
//     assignedVillageId = json['AssignedVillageId'];
//     completedVilageName = json['CompletedVilageName'];
//     pendingVillageName = json['PendingVilageName'];
//   }
// }

class SurveyEmployeeModel {
  bool? status;
  int? totalSurveyEmp;
  String? message;
  List<EmployeeData>? data;

  SurveyEmployeeModel({
    this.status,
    this.totalSurveyEmp,
    this.message,
    this.data,
  });

  SurveyEmployeeModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    totalSurveyEmp = json['TotalSurveyEmp'];
    message = json['Message'];

    if (json['Data'] != null) {
      data = <EmployeeData>[];

      json['Data'].forEach((v) {
        data!.add(EmployeeData.fromJson(v));
      });
    }
  }
}

class EmployeeData {
  int? id;
  String? fullName;
  String? fatherName;
  String? mobileNumber;
  String? alternateNumber;
  String? email;
  String? address;
  String? state;
  String? district;
  String? identityType;
  String? aadhaarNumber;
  String? voterID;
  String? userImage;

  String? joiningDate;
  String? password;
  String? createdDate;

  String? adharImage;
  String? panImage;
  String? voterIdImage;
  String? drivingLicenseImage;

  String? assignedVillageId;

  String? completedVillageName;
  String? pendingVillageName;

  EmployeeData({
    this.id,
    this.fullName,
    this.fatherName,
    this.mobileNumber,
    this.alternateNumber,
    this.email,
    this.address,
    this.state,
    this.district,
    this.identityType,
    this.aadhaarNumber,
    this.voterID,
    this.userImage,
    this.joiningDate,
    this.password,
    this.createdDate,
    this.adharImage,
    this.panImage,
    this.voterIdImage,
    this.drivingLicenseImage,
    this.assignedVillageId,
    this.completedVillageName,
    this.pendingVillageName,
  });

  EmployeeData.fromJson(Map<String, dynamic> json) {
    final emp = json['EmployeeData'] ?? {};

    id = emp['Id'];
    fullName = emp['FullName'];
    fatherName = emp['FatherName'];
    mobileNumber = emp['MobileNumber'];
    alternateNumber = emp['AlternateNumber'];
    email = emp['Email'];
    address = emp['Address'];
    state = emp['State'];
    district = emp['District'];
    identityType = emp['IdentityType'];
    aadhaarNumber = emp['AadhaarNumber'];
    voterID = emp['VoterID'];
    userImage = emp['UserImage'];

    joiningDate = emp['JoiningDate'];
    password = emp['Password'];
    createdDate = emp['CreatedDate'];

    adharImage = emp['AdharImage'];
    panImage = emp['PanImage'];
    voterIdImage = emp['VoterIdImage'];
    drivingLicenseImage = emp['DrivingLicenseImage'];

    assignedVillageId = emp['AssignedVillageId'];

    completedVillageName = json['CompletedVillageName'];
    pendingVillageName = json['PendingVillageName'];
  }
}
