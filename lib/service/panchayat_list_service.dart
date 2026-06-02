import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/panchayat_list_model.dart';
import 'apiUrl.dart';

class PanchayatService {
  Future<PanchayatModel> getPanchayatList() async {
    final response = await http.get(Uri.parse(ApiUrls.getPanchayat));

    if (response.statusCode == 200) {
      return PanchayatModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed To Load Panchayat List");
    }
  }
}
