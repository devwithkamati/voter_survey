import 'package:get/get.dart';

import '../model/emp_totalsurvey_model.dart';
import '../service/emp_totalsurvey_service.dart';

class EmployeeSurveyController extends GetxController {
  final EmployeeSurveyService _service = EmployeeSurveyService();

  RxBool isLoading = false.obs;

  RxInt totalSurveyCount = 0.obs;

  RxList<EmployeeSurveyModel> surveyList = <EmployeeSurveyModel>[].obs;

  Future<void> fetchEmployeeSurvey(int employeeId) async {
    try {
      isLoading.value = true;

      final response = await _service.getEmployeeSurvey(employeeId);

      if (response != null && response.status) {
        totalSurveyCount.value = response.totalSurveyCount;

        surveyList.assignAll(response.data);
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
