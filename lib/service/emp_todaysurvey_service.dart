import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/emp_todaysurvey_model.dart';
import 'apiUrl.dart';

class EmpTodaySurveyService {
  Future<EmpTodaySurveyResponse?> getTodaySurvey(int employeeId) async {
    try {
      final response = await http.get(
        Uri.parse(ApiUrls.getEmpTodaySurvey(employeeId)),
      );

      if (response.statusCode == 200) {
        return EmpTodaySurveyResponse.fromJson(jsonDecode(response.body));
      }

      return null;
    } catch (e) {
      print("Today Survey Error => $e");
      return null;
    }
  }
}
