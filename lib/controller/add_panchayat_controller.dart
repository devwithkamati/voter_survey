import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service/add_panchayat_service.dart';
import '../view/home_page/booth_management_screen.dart';

class AddPanchayatController extends GetxController {
  final PanchayatService _service = PanchayatService();

  RxBool isLoading = false.obs;

  TextEditingController panchayatController = TextEditingController();

  Future<void> savePanchayat({
    required int stateId,
    required int districtId,
    required int assemblyId,
    required int blockId,
  }) async {
    try {
      isLoading.value = true;

      final response = await _service.savePanchayat(
        stateId: stateId,
        districtId: districtId,
        assemblyId: assemblyId,
        blockId: blockId,
        panchayatName: panchayatController.text.trim(),
      );

      if (response.statusCode == 200) {
        Get.snackbar("Success", "Panchayat Added Successfully");
        Get.offAll(const BoothManagementScreen());
        panchayatController.clear();
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
