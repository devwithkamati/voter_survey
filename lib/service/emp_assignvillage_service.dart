import 'dart:convert';

import 'package:http/http.dart' as http;

import 'apiUrl.dart';

class AssignedVillageService {
  static Future<dynamic> getAssignedVillage(int surveyerId) async {
    final response = await http.get(
      Uri.parse("${ApiUrls.assignedVillage}?surveyerId=$surveyerId"),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    throw Exception("Failed to load villages");
  }
}
