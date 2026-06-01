import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/total_survey_model.dart';
import 'apiUrl.dart';

class TotalSurveyService {
  Future<TotalSurveyModel?> getSurveyList() async {
    try {
      final response = await http.get(Uri.parse(ApiUrls.getSurveyList));

      if (response.statusCode == 200) {
        return TotalSurveyModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
    }

    return null;
  }
}
