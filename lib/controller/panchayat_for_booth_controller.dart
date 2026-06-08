import 'package:get/get.dart';

import '../model/panchayat_for_booth_model.dart';
import '../service/panchayat_for_booth_service.dart';

class PanchayatBoothController extends GetxController {
  final PanchayatService _service = PanchayatService();

  RxList<PanchayatModel> panchayatList = <PanchayatModel>[].obs;

  RxnInt selectedPanchayatId = RxnInt();

  RxBool isLoading = false.obs;

  Future<void> getPanchayats(int blockId) async {
    try {
      isLoading.value = true;

      final response = await _service.getPanchayats(blockId);

      if (response.statusCode == 200) {
        final List data = response.data["Data"];

        panchayatList.value = data.map((e) {
          return PanchayatModel.fromJson(e);
        }).toList();
      }
    } finally {
      isLoading.value = false;
    }
  }
}
