import 'package:get/get.dart';

import '../model/state_model.dart';
import '../service/state_service.dart';

class StateController extends GetxController {
  final StateService _service = StateService();

  RxBool isLoading = false.obs;
  RxList<StateModel> stateList = <StateModel>[].obs;

  RxnInt selectedStateId = RxnInt();

  @override
  void onInit() {
    super.onInit();
    getStateList();
  }

  Future<void> getStateList() async {
    try {
      isLoading.value = true;

      final response = await _service.getStateList();

      if (response.statusCode == 200) {
        stateList.value = (response.data as List)
            .map((e) => StateModel.fromJson(e))
            .toList();
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
