import 'package:get/get.dart';

import '../model/emp_todaysurvey_model.dart';
import '../service/emp_todaysurvey_service.dart';

class EmpTodaySurveyController extends GetxController {
  final EmpTodaySurveyService _service = EmpTodaySurveyService();

  RxBool isLoading = false.obs;

  RxInt totalTodaySurvey = 0.obs;

  RxList<EmployeeSurveyModel> surveyList = <EmployeeSurveyModel>[].obs;

  Future<void> fetchTodaySurvey(int employeeId) async {
    try {
      isLoading.value = true;

      final response = await _service.getTodaySurvey(employeeId);

      if (response != null) {
        totalTodaySurvey.value = response.totalSurvey ?? 0;

        surveyList.assignAll(response.data ?? []);
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
