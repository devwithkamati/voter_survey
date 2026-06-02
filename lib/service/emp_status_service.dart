import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/emp_status_model.dart';
import 'apiUrl.dart';

class EmployeeStatusService {
  Future<UpdateEmployeeStatusResponse?> updateStatus(
    UpdateEmployeeStatusRequest request,
  ) async {
    try {
      final response = await http.patch(
        Uri.parse(ApiUrls.updateEmployeeStatus),

        headers: {"Content-Type": "application/json"},

        body: jsonEncode(request.toJson()),
      );

      if (response.statusCode == 200) {
        return UpdateEmployeeStatusResponse.fromJson(jsonDecode(response.body));
      }

      return null;
    } catch (e) {
      print("Status Update Error => $e");
      return null;
    }
  }
}
