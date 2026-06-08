import 'package:dio/dio.dart';

import 'apiUrl.dart';

class AddBoothService {
  final Dio _dio = Dio();

  Future<Response> addBooth({
    required int stateId,
    required int districtId,
    required int assemblyId,
    required int blockId,
    required int panchayatId,
    required String boothName,
  }) async {
    return await _dio.post(
      ApiUrls.addBooth,

      data: {
        "StateId": stateId,
        "DistrictId": districtId,
        "AssemblyId": assemblyId,
        "BlockId": blockId,
        "PanchayatId": panchayatId,
        "BoothName": boothName,
      },

      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
  }
}
