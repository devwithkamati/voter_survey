class PanchayatModel {
  bool? status;
  String? message;
  int? totalPanchayat;
  List<PanchayatData>? data;

  PanchayatModel({this.status, this.message, this.totalPanchayat, this.data});

  PanchayatModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    totalPanchayat = json['TotalPanchayat'];

    if (json['Data'] != null) {
      data = <PanchayatData>[];

      json['Data'].forEach((v) {
        data!.add(PanchayatData.fromJson(v));
      });
    }
  }
}

class PanchayatData {
  int? id;
  String? panchayatName;
  int? stateId;
  String? stateName;
  int? districtId;
  String? districtName;
  int? assemblyId;
  String? assemblyName;
  int? blockId;
  String? blockName;

  PanchayatData({
    this.id,
    this.panchayatName,
    this.stateId,
    this.stateName,
    this.districtId,
    this.districtName,
    this.assemblyId,
    this.assemblyName,
    this.blockId,
    this.blockName,
  });

  PanchayatData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    panchayatName = json['PanchayatName'];
    stateId = json['StateId'];
    stateName = json['StateName'];
    districtId = json['DistrictId'];
    districtName = json['DistrictName'];
    assemblyId = json['AssemblyId'];
    assemblyName = json['AssemblyName'];
    blockId = json['BlockId'];
    blockName = json['BlockName'];
  }
}
