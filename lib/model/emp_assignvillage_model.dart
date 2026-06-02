class AssignedVillageModel {
  bool? status;
  String? message;
  int? totalAssignedVillage;
  List<VillageData>? data;

  AssignedVillageModel({
    this.status,
    this.message,
    this.totalAssignedVillage,
    this.data,
  });

  AssignedVillageModel.fromJson(Map<String, dynamic> json) {
    status = json['Status'];
    message = json['Message'];
    totalAssignedVillage = json['TotalAssignedVillage'];

    if (json['Data'] != null) {
      data = <VillageData>[];
      json['Data'].forEach((v) {
        data!.add(VillageData.fromJson(v));
      });
    }
  }
}

class VillageData {
  int? id;
  String? panchayatName;
  int? blockId;
  String? blockName;

  VillageData({this.id, this.panchayatName, this.blockId, this.blockName});

  VillageData.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    panchayatName = json['PanchayatName'];
    blockId = json['BlockId'];
    blockName = json['BlockName'];
  }
}
