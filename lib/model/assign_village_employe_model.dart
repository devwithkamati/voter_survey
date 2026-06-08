class AssignVillageRequest {
  final int surveyerId;
  final List<int> villageIds;

  AssignVillageRequest({required this.surveyerId, required this.villageIds});

  Map<String, dynamic> toJson() {
    return {"SurveyerId": surveyerId, "VillageIds": villageIds};
  }
}
