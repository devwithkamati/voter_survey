class PartyVoteReportResponse {
  final bool status;
  final String message;
  final int partyCount;
  final List<PartyVoteModel> data;
  final PartyVoteSummary summary;

  PartyVoteReportResponse({
    required this.status,
    required this.message,
    required this.partyCount,
    required this.data,
    required this.summary,
  });

  factory PartyVoteReportResponse.fromJson(Map<String, dynamic> json) {
    return PartyVoteReportResponse(
      status: json["Status"] ?? false,
      message: json["Message"] ?? "",
      partyCount: json["PartyCount"] ?? 0,
      data: (json["Data"] as List? ?? [])
          .map((e) => PartyVoteModel.fromJson(e))
          .toList(),
      summary: PartyVoteSummary.fromJson(json["Summary"] ?? {}),
    );
  }
}

class PartyVoteModel {
  final int rank;
  final String partyName;
  final int votes;
  final double votePercentage;

  PartyVoteModel({
    required this.rank,
    required this.partyName,
    required this.votes,
    required this.votePercentage,
  });

  factory PartyVoteModel.fromJson(Map<String, dynamic> json) {
    return PartyVoteModel(
      rank: json["Rank"] ?? 0,
      partyName: json["PartyName"] ?? "",
      votes: json["Votes"] ?? 0,
      votePercentage: (json["VotePercentage"] ?? 0).toDouble(),
    );
  }
}

class PartyVoteSummary {
  final int totalVotes;
  final double totalVotePercentage;

  final GenderInfo male;
  final GenderInfo female;
  final GenderInfo other;

  PartyVoteSummary({
    required this.totalVotes,
    required this.totalVotePercentage,
    required this.male,
    required this.female,
    required this.other,
  });

  factory PartyVoteSummary.fromJson(Map<String, dynamic> json) {
    return PartyVoteSummary(
      totalVotes: json["TotalVotes"] ?? 0,
      totalVotePercentage: (json["TotalVotePercentage"] ?? 0).toDouble(),

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
