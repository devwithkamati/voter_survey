import 'package:dio/dio.dart';

import 'apiUrl.dart';

class BlockService {
  final Dio _dio = Dio();

  Future<Response> getBlocks(int assemblyId) async {
    return await _dio.get(ApiUrls.blockByAssembly(assemblyId));
  }
}
