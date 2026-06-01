import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voter_survey_admin/utils/appColors.dart';
import 'package:voter_survey_admin/view/dashbord_screen.dart';

import '../model/login_model.dart';
import '../service/apiUrl.dart';
import '../service/login_service.dart';
import 'auth_controller.dart';

class LoginController extends GetxController {
  TextEditingController mobileController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  RxBool isLoading = false.obs;

  LoginModel loginModel = LoginModel();

  /// 🔥 LOGIN API
  Future<void> loginApi() async {
    /// 🔥 VALIDATION
    if (mobileController.text.isEmpty) {
      customSnackBar(
        title: "Error",
        message: "Please enter mobile number",
        backgroundColor: AppColors.red,
      );

      return;
    }

    if (passwordController.text.isEmpty) {
      customSnackBar(
        title: "Error",
        message: "Please enter password",
        backgroundColor: AppColors.red,
      );

      return;
    }

    isLoading.value = true;

    final response = await ApiService.postApi(
      url: ApiUrls.login,

      body: {
        "MobileNo": mobileController.text.trim(),
        "Password": passwordController.text.trim(),
      },
    );

    isLoading.value = false;

    if (response != null) {
      loginModel = LoginModel.fromJson(response);

      /// 🔥 SUCCESS
      if (loginModel.status == "Success") {
        /// 🔥 SAVE LOGIN SESSION
        StorageService.saveLogin(true);

        customSnackBar(
          title: "Success",
          message: loginModel.message ?? "",
          backgroundColor: AppColors.green,
        );

        print("ADMIN NAME => ${loginModel.adminName}");

        /// 🔥 NAVIGATE TO DASHBOARD
        Get.offAll(() => const DashBoardScreen());
      } else {
        /// 🔥 API FAILED
        customSnackBar(
          title: "Error",
          message: loginModel.message ?? "",
          backgroundColor: AppColors.red,
        );
      }
    } else {
      /// 🔥 SERVER ERROR
      customSnackBar(
        title: "Error",
        message: "Something went wrong",
        backgroundColor: AppColors.red,
      );
    }
  }

  /// 🔥 CUSTOM SNACKBAR
  void customSnackBar({
    required String title,
    required String message,
    required Color backgroundColor,
  }) {
    Get.snackbar(
      title,
      message,

      backgroundColor: backgroundColor,
      colorText: Colors.white,

      snackPosition: SnackPosition.TOP,

      margin: const EdgeInsets.all(14),

      borderRadius: 16,

      duration: const Duration(seconds: 2),

      icon: Icon(
        title == "Success" ? Icons.check_circle : Icons.error,

        color: Colors.white,
      ),

      shouldIconPulse: true,
    );
  }

  /// 🔥 LOGOUT
  void logout() {
    StorageService.logout();

    Get.offAllNamed("/login");
  }

  @override
  void onClose() {
    mobileController.dispose();
    passwordController.dispose();

    super.onClose();
  }
}
