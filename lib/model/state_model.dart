class StateModel {
  final int id;
  final String stateName;

  StateModel({required this.id, required this.stateName});

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(id: json["Id"] ?? 0, stateName: json["StateName"] ?? "");
  }
}
