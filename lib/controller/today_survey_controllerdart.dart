import 'package:get/get.dart';

import '../model/today_survey_model.dart';
import '../service/today_survey_servicedart.dart';

class TodaySurveyController extends GetxController {
  final TodaySurveyService service = TodaySurveyService();

  RxBool isLoading = false.obs;

  RxInt todaySurveyCount = 0.obs;

  RxList<TodaySurveyData> surveyList = <TodaySurveyData>[].obs;

  @override
  void onInit() {
    super.onInit();
    getTodaySurveyApi();
  }

  Future<void> getTodaySurveyApi() async {
    try {
      isLoading(true);

      final response = await service.getTodaySurvey();

      if (response != null && response.status == true) {
        todaySurveyCount.value = response.todaySurveyCount ?? 0;

        surveyList.assignAll(response.data ?? []);
      }
    } finally {
      isLoading(false);
    }
  }
}
