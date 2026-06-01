class TodaySurveyModel {
  bool? status;
  int? todaySurveyCount;
  String? message;
  List<TodaySurveyData>? data;

  TodaySurveyModel({
    this.status,
    this.todaySurveyCount,
    this.message,
    this.data,
  });

  TodaySurveyModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    todaySurveyCount = json['TodaySurveyCount'];
    message = json['Message'];

    if (json['Data'] != null) {
      data = <TodaySurveyData>[];

      json['Data'].forEach((v) {
        data!.add(TodaySurveyData.fromJson(v));
      });
    }
  }
}

class TodaySurveyData {
  int? id;
  String? voterName;
  String? village;
  String? boothNo;
  String? mobileNo;
  String? publicImage;
  String? createDate;

  TodaySurveyData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    voterName = json['VoterName'];
    village = json['Village'];
    boothNo = json['BoothNo'];
    mobileNo = json['MobileNo'];
    publicImage = json['PublicImage'];
    createDate = json['CreateDate'];
  }
}
