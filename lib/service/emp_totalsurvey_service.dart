import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/emp_totalsurvey_model.dart';
import 'apiUrl.dart';

class EmployeeSurveyService {
  Future<EmployeeSurveyResponse?> getEmployeeSurvey(int employeeId) async {
    try {
      final response = await http.get(
        Uri.parse(ApiUrls.employeeSurveyList(employeeId)),
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        return EmployeeSurveyResponse.fromJson(jsonData);
      }

      return null;
    } catch (e) {
      print("API Error : $e");
      return null;
    }
  }
}
