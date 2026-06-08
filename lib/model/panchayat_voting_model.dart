class PanchayatVoteReportResponse {
  final bool status;
  final String message;
  final int totalPanchayat;
  final List<PanchayatVoteModel> data;
  final PanchayatVoteSummary summary;

  PanchayatVoteReportResponse({
    required this.status,
    required this.message,
    required this.totalPanchayat,
    required this.data,
    required this.summary,
  });

  factory PanchayatVoteReportResponse.fromJson(Map<String, dynamic> json) {
    return PanchayatVoteReportResponse(
      status: json["Status"] ?? false,
      message: json["Message"] ?? "",
      totalPanchayat: json["TotalPanchayat"] ?? 0,
      data: (json["Data"] as List)
          .map((e) => PanchayatVoteModel.fromJson(e))
          .toList(),
      summary: PanchayatVoteSummary.fromJson(json["Summary"] ?? {}),
    );
  }
}

class PanchayatVoteModel {
  final int villageId;
  final String panchayatName;
  final int total;
  final Map<String, dynamic> partyVotes;

  PanchayatVoteModel({
    required this.villageId,
    required this.panchayatName,
    required this.total,
    required this.partyVotes,
  });

  factory PanchayatVoteModel.fromJson(Map<String, dynamic> json) {
    return PanchayatVoteModel(
      villageId: json["VillageId"] ?? 0,
      panchayatName: json["PanchayatName"] ?? "",
      total: json["Total"] ?? 0,
      partyVotes: Map<String, dynamic>.from(json["PartyVotes"] ?? {}),
    );
  }
}

class PanchayatVoteSummary {
  final int totalVotes;
  final Map<String, dynamic> partyTotals;

  final GenderInfo male;
  final GenderInfo female;
  final GenderInfo other;

  PanchayatVoteSummary({
    required this.totalVotes,
    required this.partyTotals,
    required this.male,
    required this.female,
    required this.other,
  });

  factory PanchayatVoteSummary.fromJson(Map<String, dynamic> json) {
    return PanchayatVoteSummary(
      totalVotes: json["TotalVotes"] ?? 0,
      partyTotals: Map<String, dynamic>.from(json["PartyTotals"] ?? {}),

      male: GenderInfo.fromJson(json["GenderTotals"]?["पुरुष"] ?? {}),

      female: GenderInfo.fromJson(json["GenderTotals"]?["महिला"] ?? {}),

      other: GenderInfo.fromJson(json["GenderTotals"]?["अन्य"] ?? {}),
    );
  }
}

class GenderInfo {
  final int count;
  final double percentage;

  GenderInfo({required this.count, required this.percentage});

  factory GenderInfo.fromJson(Map<String, dynamic> json) {
    return GenderInfo(
      count: json["Count"] ?? 0,
      percentage: (json["Percentage"] ?? 0).toDouble(),
    );
  }
}
