import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/party_voting_model.dart';
import 'apiUrl.dart';

class PartyVoteReportService {
  static Future<PartyVoteReportResponse?> getPartyVoteReport() async {
    try {
      final response = await http.get(Uri.parse(ApiUrls.partyWiseVoteReport));

      if (response.statusCode == 200) {
        return PartyVoteReportResponse.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e);
    }

    return null;
  }
}
