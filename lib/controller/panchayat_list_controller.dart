import 'package:get/get.dart';

import '../model/panchayat_list_model.dart';
import '../service/panchayat_list_service.dart';

class PanchayatController extends GetxController {
  final PanchayatService _service = PanchayatService();

  RxBool isLoading = false.obs;

  RxInt totalPanchayat = 0.obs;

  RxList<PanchayatData> panchayatList = <PanchayatData>[].obs;

  @override
  void onInit() {
    super.onInit();
    getPanchayatList();
  }

  Future<void> getPanchayatList() async {
    try {
      isLoading.value = true;

      final response = await _service.getPanchayatList();

      panchayatList.assignAll(response.data ?? []);

      totalPanchayat.value = response.totalPanchayat ?? 0;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
