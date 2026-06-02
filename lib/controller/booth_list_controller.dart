import 'package:get/get.dart';

import '../model/booth_list_model.dart';
import '../service/booth_list_service.dart';

class BoothController extends GetxController {
  final BoothService _service = BoothService();

  RxBool isLoading = false.obs;

  RxInt totalBooth = 0.obs;

  RxList<BoothData> boothList = <BoothData>[].obs;

  @override
  void onInit() {
    super.onInit();
    getBoothList();
  }

  Future<void> getBoothList() async {
    try {
      isLoading.value = true;

      final response = await _service.getBoothList();

      boothList.assignAll(response.data ?? []);

      totalBooth.value = response.totalBooth ?? 0;
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
