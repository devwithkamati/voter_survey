import 'package:dio/dio.dart';

import 'apiUrl.dart';

class DistrictService {
  final Dio _dio = Dio();

  Future<Response> getDistricts(int stateId) async {
    return await _dio.get(ApiUrls.districtByState(stateId));
  }
}
