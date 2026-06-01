import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/member_model.dart';
import 'apiUrl.dart';

class MemberService {
  Future<MemberModel?> getMembers() async {
    try {
      final response = await http.get(Uri.parse(ApiUrls.getMember));

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        return MemberModel.fromJson(jsonData);
      }
    } catch (e) {
      print("ERROR : $e");
    }

    return null;
  }
}
