import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voter_survey_admin/view/dashbord_screen.dart';

import '../model/change_password_model.dart';
import '../service/change_password_service.dart';
import 'auth_controller.dart';

class ChangePasswordController extends GetxController {
  final ChangePasswordService _service = ChangePasswordService();

  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  RxBool isLoading = false.obs;

  Future<void> changePassword() async {
    try {
      print("Admin ID => ${StorageService.getAdminId()}");

      /// Validation
      if (oldPasswordController.text.trim().isEmpty) {
        Get.snackbar("Error", "Please enter old password");
        return;
      }

      if (newPasswordController.text.trim().isEmpty) {
        Get.snackbar("Error", "Please enter new password");
        return;
      }

      if (confirmPasswordController.text.trim().isEmpty) {
        Get.snackbar("Error", "Please enter confirm password");
        return;
      }

      if (newPasswordController.text.trim() !=
          confirmPasswordController.text.trim()) {
        Get.snackbar("Error", "New Password and Confirm Password do not match");
        return;
      }

      isLoading.value = true;

      final request = ChangePasswordRequest(
        oldPassword: oldPasswordController.text.trim(),
        newPassword: newPasswordController.text.trim(),
        confirmPassword: confirmPasswordController.text.trim(),
        adminId: StorageService.getAdminId(),
      );

      final response = await _service.changePassword(request);

      print("Status => ${response.status}");
      print("Message => ${response.message}");

      if (response.status == true) {
        Get.snackbar(
          "Success",
          response.message,
          snackPosition: SnackPosition.TOP,
        );

        oldPasswordController.clear();
        newPasswordController.clear();
        confirmPasswordController.clear();

        await Future.delayed(const Duration(seconds: 1));

        Get.closeAllSnackbars();

        if (Get.isOverlaysOpen) {
          Get.offAll(() => DashBoardScreen());
        }

        Get.back(result: true);
      } else {
        Get.snackbar(
          "Error",
          response.message,
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      print("Change Password Error => $e");

      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.TOP);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
