import 'package:get/get.dart';

import '../model/total_survey_model.dart';
import '../service/total_survey_service.dart';

class TotalSurveyController extends GetxController {
  final TotalSurveyService service = TotalSurveyService();

  RxBool isLoading = false.obs;

  RxInt totalSurvey = 0.obs;

  RxList<SurveyData> surveyList = <SurveyData>[].obs;

  @override
  void onInit() {
    super.onInit();
    getSurveyApi();
  }

  Future<void> getSurveyApi() async {
    try {
      isLoading(true);

      final response = await service.getSurveyList();

      if (response != null && response.status == true) {
        totalSurvey.value = response.totalSurvey ?? 0;

        surveyList.assignAll(response.data ?? []);
      }
    } finally {
      isLoading(false);
    }
  }
}
