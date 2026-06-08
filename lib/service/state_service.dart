import 'package:dio/dio.dart';

import 'apiUrl.dart';

class StateService {
  final Dio _dio = Dio();

  Future<Response> getStateList() async {
    return await _dio.get(ApiUrls.stateList);
  }
}
