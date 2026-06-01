import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/today_survey_model.dart';
import 'apiUrl.dart';

class TodaySurveyService {
  Future<TodaySurveyModel?> getTodaySurvey() async {
    try {
      final response = await http.get(Uri.parse(ApiUrls.getTodaySurvey));

      if (response.statusCode == 200) {
        return TodaySurveyModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print("API ERROR : $e");
    }

    return null;
  }
}
