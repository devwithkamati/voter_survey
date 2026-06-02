import 'package:get/get.dart';

import '../model/survey_by_village_model.dart';
import '../service/survey_by_village_service.dart';

class SurveyByVillageController extends GetxController {
  final SurveyByVillageService service = SurveyByVillageService();

  RxBool isLoading = false.obs;

  RxList<SurveyVillageData> surveyList = <SurveyVillageData>[].obs;

  Future<void> getSurveyList(int panchayatId) async {
    try {
      isLoading.value = true;

      final result = await service.getSurveyListByVillage(panchayatId);

      surveyList.assignAll(result.data ?? []);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
