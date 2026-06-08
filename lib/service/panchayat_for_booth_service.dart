import 'package:dio/dio.dart';

import 'apiUrl.dart';

class PanchayatService {
  final Dio _dio = Dio();

  Future<Response> getPanchayats(int blockId) async {
    return await _dio.get(ApiUrls.panchayatByBlock(blockId));
  }
}
