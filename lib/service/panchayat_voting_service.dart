import 'package:dio/dio.dart';

import '../model/panchayat_voting_model.dart';
import 'apiUrl.dart';

class PanchayatVoteReportService {
  static Future<PanchayatVoteReportResponse?> getPanchayatVoteReport() async {
    try {
      final response = await Dio().get(ApiUrls.panchayatVoteReport);

      if (response.statusCode == 200) {
        return PanchayatVoteReportResponse.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }

    return null;
  }
}
