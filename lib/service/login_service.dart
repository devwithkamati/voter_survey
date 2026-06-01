import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static Future<dynamic> postApi({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await http.post(Uri.parse(url), body: body);

      print(response.body);

      return jsonDecode(response.body);
    } catch (e) {
      print("API ERROR => $e");

      return null;
    }
  }
}
