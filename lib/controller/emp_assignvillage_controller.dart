import 'package:get/get.dart';

import '../model/emp_assignvillage_model.dart';
import '../service/emp_assignvillage_service.dart';

class AssignedVillageController extends GetxController {
  RxBool isLoading = false.obs;

  RxInt totalAssignedVillage = 0.obs;

  RxList<VillageData> villageList = <VillageData>[].obs;

  Future<void> fetchAssignedVillage(int employeeId) async {
    try {
      isLoading.value = true;

      final response = await AssignedVillageService.getAssignedVillage(
        employeeId,
      );

      if (response["Status"] == true) {
        totalAssignedVillage.value = response["TotalAssignedVillage"] ?? 0;

        villageList.value = (response["Data"] as List)
            .map((e) => VillageData.fromJson(e))
            .toList();
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
