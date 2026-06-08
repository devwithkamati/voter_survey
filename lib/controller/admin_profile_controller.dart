import 'package:get/get.dart';

import '../model/admin_profile_model.dart';
import '../service/admin_profile_service.dart';

class AdminProfileController extends GetxController {
  final AdminProfileService _service = AdminProfileService();

  RxBool isLoading = false.obs;

  Rxn<AdminProfileModel> profile = Rxn<AdminProfileModel>();

  @override
  void onInit() {
    super.onInit();

    fetchProfile();
  }

  Future<void> fetchProfile() async {
    try {
      isLoading.value = true;

      final result = await _service.getProfile(1);

      if (result != null) {
        profile.value = result;
      }
    } finally {
      isLoading.value = false;
    }
  }
}
