class EmployeeSurveyModel {
  int? id;
  String? voterName;
  String? village;
  String? boothNo;
  String? mobileNo;
  String? occupation;
  String? voterId;
  String? age;
  String? gender;
  String? workBetterInAssembly;
  String? satisfiedOrNot;
  String? workDoneByMLA;
  String? isMlaWinAgain;
  String? strongestCandidate;
  String? easyToMeetCandidate;
  String? candidateProfile;
  String? winingPotential;
  String? publicVote;
  String? publicOpinion;
  String? partySituation;
  String? publicSuggestion;
  String? publicImage;
  String? category;
  String? isVoting;
  String? lastElectionVotingParty;
  String? currentElectionParty;
  String? isPublicSatisfiedFromCurrentMLA;
  String? publicPriority;
  String? problemSolvingCandidate;
  String? whoStandWithPublicInBadSituation;
  String? isCurrentMLAActive;
  String? meetingPeopleWith;
  String? satisfiedWithPresentGovernmmentOrNot;
  String? winningParty;
  String? totalVoterInHouse;
  String? voteDeciderInHouse;
  String? voteDeciderName;
  String? voteDeciderContact;
  String? voteDeciderOccupation;
  int? villageId;
  int? surveyEmployeeId;
  String? createDate;
  String? publoicProblem;
  String? whichTypeCandidatePeoplePrefer;
  String? ifTodayElectionHappenWhoseYouVote;
  String? yourAreaSituation;
  String? isNdaAllianceStrong;
  String? birthDay;
  String? marriedOrUnMarried;
  String? anniversary;

  EmployeeSurveyModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    voterName = json['VoterName'];
    village = json['Village'];
    boothNo = json['BoothNo'];
    mobileNo = json['MobileNo'];
    occupation = json['Occupation'];
    voterId = json['VoterId'];
    age = json['Age'];
    gender = json['Gender'];
    workBetterInAssembly = json['WorkBetterInAssembly'];
    satisfiedOrNot = json['SatisfiedOrNot'];
    workDoneByMLA = json['WorkDoneByMLA'];
    isMlaWinAgain = json['IsMlaWinAgain'];
    strongestCandidate = json['StrongestCandidate'];
    easyToMeetCandidate = json['EasyToMeetCandidate'];
    candidateProfile = json['CandidateProfile'];
    winingPotential = json['WiningPotential'];
    publicVote = json['Public_Vote'];
    publicOpinion = json['PublicOpinion'];
    partySituation = json['Party_Situation'];
    publicSuggestion = json['PublicSuggestion'];
    publicImage = json['PublicImage'];
    category = json['Category'];
    isVoting = json['IsVoting'];
    lastElectionVotingParty = json['LastElectionVotingParty'];
    currentElectionParty = json['CurrentElectionParty'];
    isPublicSatisfiedFromCurrentMLA = json['IsPublicSatisfiedFromCurrentMLA'];
    publicPriority = json['Public_Priority'];
    problemSolvingCandidate = json['Problem_Solving_Candidate'];
    whoStandWithPublicInBadSituation = json['WhoStandWithPublicInBadSituation'];
    isCurrentMLAActive = json['IsCurrentMLA_Active'];
    meetingPeopleWith = json['MeetingPeopleWith'];
    satisfiedWithPresentGovernmmentOrNot =
        json['SatisfiedWithPresentGovernmmentOrNot'];
    winningParty = json['WinningParty'];
    totalVoterInHouse = json['TotalVoterInHouse'];
    voteDeciderInHouse = json['VoteDeciderInHouse'];
    voteDeciderName = json['VoteDeciderName'];
    voteDeciderContact = json['VoteDeciderContact'];
    voteDeciderOccupation = json['VoteDeciderOccupation'];
    villageId = json['VillageId'];
    surveyEmployeeId = json['SurveyEmployeeId'];
    createDate = json['CreateDate'];
    publoicProblem = json['Publoic_Problem'];
    whichTypeCandidatePeoplePrefer = json['WhichTypeCandidatePeoplePrefer'];
    ifTodayElectionHappenWhoseYouVote =
        json['IfTodayElectionHappenWhoseYouVote'];
    yourAreaSituation = json['YourAreaSituation'];
    isNdaAllianceStrong = json['IsNdaAllianceStrong'];
    birthDay = json['BirthDay'];
    marriedOrUnMarried = json['MarriedOrUnMarried'];
    anniversary = json['Anniversary'];
  }
}

class EmployeeSurveyResponse {
  final bool status;
  final int totalSurveyCount;
  final String message;
  final List<EmployeeSurveyModel> data;

  EmployeeSurveyResponse({
    required this.status,
    required this.totalSurveyCount,
    required this.message,
    required this.data,
  });

  factory EmployeeSurveyResponse.fromJson(Map<String, dynamic> json) {
    return EmployeeSurveyResponse(
      status: json["Status"] ?? false,
      totalSurveyCount: json["TotalSurveyCount"] ?? 0,
      message: json["Message"] ?? "",
      data: (json["Data"] as List)
          .map((e) => EmployeeSurveyModel.fromJson(e))
          .toList(),
    );
  }
}
