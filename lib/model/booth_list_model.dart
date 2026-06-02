class BoothModel {
  bool? status;
  String? message;
  int? totalBooth;
  List<BoothData>? data;

  BoothModel({this.status, this.message, this.totalBooth, this.data});

  BoothModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    totalBooth = json['TotalBooth'];

    if (json['Data'] != null) {
      data = <BoothData>[];

      json['Data'].forEach((v) {
        data!.add(BoothData.fromJson(v));
      });
    }
  }
}

class BoothData {
  int? id;
  String? boothName;
  int? stateId;
  String? stateName;
  int? districtId;
  String? districtName;
  int? assemblyId;
  String? assemblyName;
  int? blockId;
  String? blockName;
  int? panchayatId;
  String? panchayatName;

  BoothData({
    this.id,
    this.boothName,
    this.stateId,
    this.stateName,
    this.districtId,
    this.districtName,
    this.assemblyId,
    this.assemblyName,
    this.blockId,
    this.blockName,
    this.panchayatId,
    this.panchayatName,
  });

  BoothData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    boothName = json['BoothName'];
    stateId = json['StateId'];
    stateName = json['StateName'];
    districtId = json['DistrictId'];
    districtName = json['DistrictName'];
    assemblyId = json['AssemblyId'];
    assemblyName = json['AssemblyName'];
    blockId = json['BlockId'];
    blockName = json['BlockName'];
    panchayatId = json['PanchayatId'];
    panchayatName = json['PanchayatName'];
  }
}
