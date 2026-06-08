class AssemblyModel {
  final int id;
  final String assemblyName;

  AssemblyModel({required this.id, required this.assemblyName});

  factory AssemblyModel.fromJson(Map<String, dynamic> json) {
    return AssemblyModel(
      id: json["Id"] ?? 0,
      assemblyName: json["AssemblyName"] ?? "",
    );
  }
}
