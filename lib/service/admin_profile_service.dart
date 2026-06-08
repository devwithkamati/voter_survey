import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/admin_profile_model.dart';
import 'apiUrl.dart';

class AdminProfileService {
  Future<AdminProfileModel?> getProfile(int id) async {
    try {
      final response = await http.get(
        Uri.parse("${ApiUrls.adminProfile}?id=$id"),
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        if (jsonData["Status"] == true) {
          return AdminProfileModel.fromJson(jsonData["Data"]);
        }
      }

      return null;
    } catch (e) {
      print("Profile Error : $e");
      return null;
    }
  }
}
