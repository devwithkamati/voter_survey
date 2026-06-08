import 'package:get/get.dart';

import '../model/assign_village_employe_model.dart';
import '../service/assign_village_employe_service.dart';

class AssignVillageController extends GetxController {
  final AssignVillageService _service = AssignVillageService();

  RxBool isLoading = false.obs;

  Future<bool> assignVillage({
    required int surveyerId,
    required List<int> villageIds,
  }) async {
    try {
      isLoading.value = true;

      final request = AssignVillageRequest(
        surveyerId: surveyerId,
        villageIds: villageIds,
      );

      await _service.assignVillage(request);

      return true;
    } catch (e) {
      Get.snackbar("Error", e.toString());
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
