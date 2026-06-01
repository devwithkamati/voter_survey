class MemberModel {
  bool? status;
  int? totalMember;
  String? message;
  List<MemberData>? data;

  MemberModel({this.status, this.totalMember, this.message, this.data});

  MemberModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    totalMember = json['TotalMember'];
    message = json['Message'];

    if (json['Data'] != null) {
      data = <MemberData>[];

      json['Data'].forEach((v) {
        data!.add(MemberData.fromJson(v));
      });
    }
  }
}

class MemberData {
  int? id;
  String? fullName;
  String? mobileNumber;
  String? gender;
  String? photo;
  String? state;
  String? district;
  String? villageWard;
  String? boothNumber;
  String? occupation;

  MemberData({
    this.id,
    this.fullName,
    this.mobileNumber,
    this.gender,
    this.photo,
    this.state,
    this.district,
    this.villageWard,
    this.boothNumber,
    this.occupation,
  });

  MemberData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    fullName = json['FullName'];
    mobileNumber = json['MobileNumber'];
    gender = json['Gender'];
    photo = json['Photo'];
    state = json['State'];
    district = json['District'];
    villageWard = json['VillageWard'];
    boothNumber = json['BoothNumber'];
    occupation = json['Occupation'];
  }
}
