import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/change_password_model.dart';
import 'apiUrl.dart';

class ChangePasswordService {
  Future<ChangePasswordResponse> changePassword(
    ChangePasswordRequest request,
  ) async {
    final response = await http.post(
      Uri.parse(ApiUrls.changePassword),
      body: request.toMap(),
    );

    if (response.statusCode == 200) {
      return ChangePasswordResponse.fromJson(jsonDecode(response.body));
    }

    throw Exception("Failed to change password");
  }
}
