import 'package:get/get.dart';

import '../model/emp_status_model.dart';
import '../service/emp_status_service.dart';

class EmployeeStatusController extends GetxController {
  final EmployeeStatusService _service = EmployeeStatusService();

  RxBool isLoading = false.obs;

  RxBool currentStatus = false.obs;

  Future<void> updateEmployeeStatus({
    required int employeeId,
    required bool isActive,
  }) async {
    try {
      isLoading.value = true;

      final response = await _service.updateStatus(
        UpdateEmployeeStatusRequest(employeeId: employeeId, isActive: isActive),
      );

      if (response != null && response.status == true) {
        currentStatus.value = response.currentStatus ?? false;

        Get.snackbar("Success", response.message ?? "Updated");
      }
    } finally {
      isLoading.value = false;
    }
  }
}
