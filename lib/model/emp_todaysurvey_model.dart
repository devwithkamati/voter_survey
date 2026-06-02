class EmpTodaySurveyResponse {
  bool? status;
  int? totalSurvey;
  List<EmployeeSurveyModel>? data;

  EmpTodaySurveyResponse({this.status, this.totalSurvey, this.data});

  factory EmpTodaySurveyResponse.fromJson(Map<String, dynamic> json) {
    return EmpTodaySurveyResponse(
      status: json["Status"],
      totalSurvey: json["TotalSurvey"],
      data: json["Data"] == null
          ? []
          : List<EmployeeSurveyModel>.from(
              json["Data"].map((x) => EmployeeSurveyModel.fromJson(x)),
            ),
    );
  }
}

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

  EmployeeSurveyModel({
    this.id,
    this.voterName,
    this.village,
    this.boothNo,
    this.mobileNo,
    this.occupation,
    this.voterId,
    this.age,
    this.gender,
    this.workBetterInAssembly,
    this.satisfiedOrNot,
    this.workDoneByMLA,
    this.isMlaWinAgain,
    this.strongestCandidate,
    this.easyToMeetCandidate,
    this.candidateProfile,
    this.winingPotential,
    this.publicVote,
    this.publicOpinion,
    this.partySituation,
    this.publicSuggestion,
    this.publicImage,
    this.category,
    this.isVoting,
    this.lastElectionVotingParty,
    this.currentElectionParty,
    this.isPublicSatisfiedFromCurrentMLA,
    this.publicPriority,
    this.problemSolvingCandidate,
    this.whoStandWithPublicInBadSituation,
    this.isCurrentMLAActive,
    this.meetingPeopleWith,
    this.satisfiedWithPresentGovernmmentOrNot,
    this.winningParty,
    this.totalVoterInHouse,
    this.voteDeciderInHouse,
    this.voteDeciderName,
    this.voteDeciderContact,
    this.voteDeciderOccupation,
    this.villageId,
    this.surveyEmployeeId,
    this.createDate,
    this.publoicProblem,
    this.whichTypeCandidatePeoplePrefer,
    this.ifTodayElectionHappenWhoseYouVote,
    this.yourAreaSituation,
    this.isNdaAllianceStrong,
    this.birthDay,
    this.marriedOrUnMarried,
    this.anniversary,
  });

  factory EmployeeSurveyModel.fromJson(Map<String, dynamic> json) {
    return EmployeeSurveyModel(
      id: json["Id"],
      voterName: json["VoterName"],
      village: json["Village"],
      boothNo: json["BoothNo"],
      mobileNo: json["MobileNo"],
      occupation: json["Occupation"],
      voterId: json["VoterId"],
      age: json["Age"],
      gender: json["Gender"],
      workBetterInAssembly: json["WorkBetterInAssembly"],
      satisfiedOrNot: json["SatisfiedOrNot"],
      workDoneByMLA: json["WorkDoneByMLA"],
      isMlaWinAgain: json["IsMlaWinAgain"],
      strongestCandidate: json["StrongestCandidate"],
      easyToMeetCandidate: json["EasyToMeetCandidate"],
      candidateProfile: json["CandidateProfile"],
      winingPotential: json["WiningPotential"],
      publicVote: json["Public_Vote"],
      publicOpinion: json["PublicOpinion"],
      partySituation: json["Party_Situation"],
      publicSuggestion: json["PublicSuggestion"],
      publicImage: json["PublicImage"],
      category: json["Category"],
      isVoting: json["IsVoting"],
      lastElectionVotingParty: json["LastElectionVotingParty"],
      currentElectionParty: json["CurrentElectionParty"],
      isPublicSatisfiedFromCurrentMLA: json["IsPublicSatisfiedFromCurrentMLA"],
      publicPriority: json["Public_Priority"],
      problemSolvingCandidate: json["Problem_Solving_Candidate"],
      whoStandWithPublicInBadSituation:
          json["WhoStandWithPublicInBadSituation"],
      isCurrentMLAActive: json["IsCurrentMLA_Active"],
      meetingPeopleWith: json["MeetingPeopleWith"],
      satisfiedWithPresentGovernmmentOrNot:
          json["SatisfiedWithPresentGovernmmentOrNot"],
      winningParty: json["WinningParty"],
      totalVoterInHouse: json["TotalVoterInHouse"],
      voteDeciderInHouse: json["VoteDeciderInHouse"],
      voteDeciderName: json["VoteDeciderName"],
      voteDeciderContact: json["VoteDeciderContact"],
      voteDeciderOccupation: json["VoteDeciderOccupation"],
      villageId: json["VillageId"],
      surveyEmployeeId: json["SurveyEmployeeId"],
      createDate: json["CreateDate"],
      publoicProblem: json["Publoic_Problem"],
      whichTypeCandidatePeoplePrefer: json["WhichTypeCandidatePeoplePrefer"],
      ifTodayElectionHappenWhoseYouVote:
          json["IfTodayElectionHappenWhoseYouVote"],
      yourAreaSituation: json["YourAreaSituation"],
      isNdaAllianceStrong: json["IsNdaAllianceStrong"],
      birthDay: json["BirthDay"],
      marriedOrUnMarried: json["MarriedOrUnMarried"],
      anniversary: json["Anniversary"],
    );
  }
}
