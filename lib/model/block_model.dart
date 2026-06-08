class BlockModel {
  final int id;
  final String blockName;

  BlockModel({required this.id, required this.blockName});

  factory BlockModel.fromJson(Map<String, dynamic> json) {
    return BlockModel(id: json["Id"] ?? 0, blockName: json["BlockName"] ?? "");
  }
}
