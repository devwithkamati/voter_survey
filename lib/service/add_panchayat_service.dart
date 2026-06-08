import 'package:dio/dio.dart';

import 'apiUrl.dart';

class PanchayatService {
  final Dio _dio = Dio();

  Future<Response> savePanchayat({
    required int stateId,
    required int districtId,
    required int assemblyId,
    required int blockId,
    required String panchayatName,
  }) async {
    return await _dio.post(
      ApiUrls.savePanchayat,
      data: {
        "StateId": stateId,
        "DistrictId": districtId,
        "AssemblyId": assemblyId,
        "BlockId": blockId,
        "PanchayatName": panchayatName,
      },
    );
  }
}
