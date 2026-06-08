class ApiUrls {
  static const String baseUrl = "https://www.aniltripathi.in/API/";

  static const String login = "${baseUrl}AdminLogin/Login";
  static const String adminProfile = "$baseUrl/AdminProfile/GetProfile";
  static const changePassword = "$baseUrl/ChangePassword/ChangePassword";

  static const String getMember = "${baseUrl}JoinCampaignList/GetMember";

  static const String getSurveyEmployee =
      "${baseUrl}SurveyEmployeeList/GetEmployee";

  static const String getSurveyList = "${baseUrl}SurveyList/GetSurveyData";

  static const String getTodaySurvey =
      "${baseUrl}TodaySurveyList/GetTodaySurveyList";

  static const String addSurveyEmployee =
      "${baseUrl}AddSurveyEmployee/AddSurveyEmployee";

  static const String getPanchayat = "${baseUrl}PanchayatList/GetPanchayat";

  static const String getBooth = "${baseUrl}AllBoothList/GetBooth";

  static const String surveyListByVillage =
      "${baseUrl}SurveyListByVillage/GetSurveyListByVillage";

  /// TOTAL SURVEY API
  static String employeeSurveyList(int employeeId) =>
      "$baseUrl/EmployeeSurveyList/GetEmployeeSurveyList?surveyEmployeeId=$employeeId";

  static String getEmpTodaySurvey(int employeeId) =>
      "$baseUrl/EmployeeTodaySurvey/GetTodaySurvey?EmployeeId=$employeeId";

  /// ASSIGNED VILLAGE API
  static const String assignedVillage =
      "${baseUrl}AssignedVillageList/GetAssignedVillage";
  static const String updateEmployeeStatus =
      "$baseUrl/UpdateEmployeeStatus/UpdateStatus";
  static const String candidateWiseVoteReport =
      "$baseUrl/CandidateWiseVoteReport/GetCandidateWiseVoteReport";
  static const String partyWiseVoteReport =
      "$baseUrl/PartyWiseVoteReport/GetPartyWiseVoteReport";

  /// Panchayat Vote Report
  static const String panchayatVoteReport =
      "$baseUrl/PanchayatVoteReport/GetPanchayatVoteReport";

  static const String stateList = "$baseUrl/State/GetStateList";

  static String districtByState(int stateId) =>
      "${baseUrl}District/GetDistrictByState?stateId=$stateId";
  static String assemblyByDistrict(int districtId) =>
      "${baseUrl}Assembly/GetAssemblyByDistrict?districtId=$districtId";
  static String blockByAssembly(int assemblyId) =>
      "${baseUrl}Block/GetBlockByAssembly?assemblyId=$assemblyId";
  static const String savePanchayat = "${baseUrl}AddPanchayat/SavePanchayat";
  static String panchayatByBlock(int blockId) =>
      "${baseUrl}Panchayat/GetPanchayatByBlock?BlockId=$blockId";
  static const String addBooth = "${baseUrl}AddBooth/AddBooth";
  static const String assignVillage =
      "$baseUrl/AssignVillage/SaveAssignedVillage";
}
