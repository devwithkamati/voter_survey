class DistrictModel {
  final int id;
  final String districtName;

  DistrictModel({required this.id, required this.districtName});

  factory DistrictModel.fromJson(Map<String, dynamic> json) {
    return DistrictModel(
      id: json["Id"] ?? 0,
      districtName: json["DistrictName"] ?? "",
    );
  }
}
