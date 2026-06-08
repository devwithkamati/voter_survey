class PanchayatModel {
  final int id;
  final String panchayatName;

  PanchayatModel({required this.id, required this.panchayatName});

  factory PanchayatModel.fromJson(Map<String, dynamic> json) {
    return PanchayatModel(
      id: json["Id"] ?? 0,
      panchayatName: json["PanchayatName"] ?? "",
    );
  }
}
