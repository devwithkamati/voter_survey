import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/condidate_voting_model.dart';
import 'apiUrl.dart';

class CandidateVoteReportService {
  static Future<CandidateVoteReportResponse?> getCandidateVoteReport() async {
    try {
      final response = await http.get(
        Uri.parse(ApiUrls.candidateWiseVoteReport),
      );

      if (response.statusCode == 200) {
        return CandidateVoteReportResponse.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
    }

    return null;
  }
}
