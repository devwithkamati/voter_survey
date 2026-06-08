import 'package:get/get.dart';

import '../model/district_model.dart';
import '../service/district_service.dart';

class DistrictController extends GetxController {
  final DistrictService _service = DistrictService();

  RxList<DistrictModel> districtList = <DistrictModel>[].obs;

  RxBool isLoading = false.obs;

  RxnInt selectedDistrictId = RxnInt();

  Future<void> getDistricts(int stateId) async {
    try {
      isLoading.value = true;

      final response = await _service.getDistricts(stateId);

      if (response.statusCode == 200) {
        districtList.value = (response.data as List)
            .map((e) => DistrictModel.fromJson(e))
            .toList();
      }
    } finally {
      isLoading.value = false;
    }
  }
}
