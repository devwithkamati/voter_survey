import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/survey_employee_model.dart';
import 'apiUrl.dart';

class SurveyEmployeeService {
  Future<SurveyEmployeeModel?> getEmployees() async {
    try {
      final response = await http.get(Uri.parse(ApiUrls.getSurveyEmployee));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        return SurveyEmployeeModel.fromJson(jsonData);
      }
    } catch (e) {
      print("API ERROR : $e");
    }

    return null;
  }
}
