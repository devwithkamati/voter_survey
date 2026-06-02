import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/booth_list_model.dart';
import 'apiUrl.dart';

class BoothService {
  Future<BoothModel> getBoothList() async {
    final response = await http.get(Uri.parse(ApiUrls.getBooth));

    if (response.statusCode == 200) {
      return BoothModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed To Load Booth List");
    }
  }
}
