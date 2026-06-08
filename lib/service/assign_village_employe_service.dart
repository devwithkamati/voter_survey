import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/assign_village_employe_model.dart';
import 'apiUrl.dart';

class AssignVillageService {
  Future<bool> assignVillage(AssignVillageRequest request) async {
    print("REQUEST = ${request.toJson()}");

    final response = await http.post(
      Uri.parse(ApiUrls.assignVillage),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(request.toJson()),
    );

    print("STATUS = ${response.statusCode}");
    print("RESPONSE = ${response.body}");

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Failed To Assign Village");
    }
  }
}
