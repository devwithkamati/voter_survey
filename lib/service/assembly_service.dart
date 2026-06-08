import 'package:dio/dio.dart';

import 'apiUrl.dart';

class AssemblyService {
  final Dio _dio = Dio();

  Future<Response> getAssemblies(int districtId) async {
    return await _dio.get(ApiUrls.assemblyByDistrict(districtId));
  }
}
