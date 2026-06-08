class CandidateVoteReportResponse {
  final bool status;
  final String message;
  final int candidateCount;
  final List<CandidateVoteModel> data;
  final VoteSummary summary;

  CandidateVoteReportResponse({
    required this.status,
    required this.message,
    required this.candidateCount,
    required this.data,
    required this.summary,
  });

  factory CandidateVoteReportResponse.fromJson(Map<String, dynamic> json) {
    return CandidateVoteReportResponse(
      status: json["Status"] ?? false,
      message: json["Message"] ?? "",
      candidateCount: json["CandidateCount"] ?? 0,
      data: (json["Data"] as List? ?? [])
          .map((e) => CandidateVoteModel.fromJson(e))
          .toList(),
      summary: VoteSummary.fromJson(json["Summary"] ?? {}),
    );
  }
}

class CandidateVoteModel {
  final int rank;
  final String candidateName;
  final int votes;
  final double votePercentage;

  /// Panchayat Wise Votes
  final Map<String, dynamic> panchayatVotes;

  CandidateVoteModel({
    required this.rank,
    required this.candidateName,
    required this.votes,
    required this.votePercentage,
    required this.panchayatVotes,
  });

  factory CandidateVoteModel.fromJson(Map<String, dynamic> json) {
    return CandidateVoteModel(
      rank: json["Rank"] ?? 0,
      candidateName: json["CandidateName"] ?? "",
      votes: json["Votes"] ?? 0,
      votePercentage: (json["VotePercentage"] ?? 0).toDouble(),
      panchayatVotes: Map<String, dynamic>.from(json["PanchayatVotes"] ?? {}),
    );
  }
}

class VoteSummary {
  final int totalVotes;
  final double totalVotePercentage;

  final GenderInfo male;
  final GenderInfo female;
  final GenderInfo other;

  VoteSummary({
    required this.totalVotes,
    required this.totalVotePercentage,
    required this.male,
    required this.female,
    required this.other,
  });

  factory VoteSummary.fromJson(Map<String, dynamic> json) {
    return VoteSummary(
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
