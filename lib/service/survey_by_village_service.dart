import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/survey_by_village_model.dart';
import 'apiUrl.dart';

class SurveyByVillageService {
  Future<SurveyByVillageModel> getSurveyListByVillage(int panchayatId) async {
    final response = await http.get(
      Uri.parse("${ApiUrls.surveyListByVillage}?PanchayatId=$panchayatId"),
    );

    if (response.statusCode == 200) {
      return SurveyByVillageModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed To Load Survey List");
    }
  }
}
