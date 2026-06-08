import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voter_survey_admin/view/home_page/booth_management_screen.dart';

import '../service/add_booth_service.dart';

class AddBoothController extends GetxController {
  final AddBoothService _service = AddBoothService();

  RxBool isLoading = false.obs;

  TextEditingController boothNameController = TextEditingController();

  Future<void> addBooth({
    required int stateId,
    required int districtId,
    required int assemblyId,
    required int blockId,
    required int panchayatId,
  }) async {
    try {
      isLoading.value = true;

      final response = await _service.addBooth(
        stateId: stateId,
        districtId: districtId,
        assemblyId: assemblyId,
        blockId: blockId,
        panchayatId: panchayatId,
        boothName: boothNameController.text.trim(),
      );

      if (response.data["Status"] == true) {
        Get.snackbar("Success", response.data["Message"]);

        boothNameController.clear();

        Get.offAll(() => BoothManagementScreen());
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
