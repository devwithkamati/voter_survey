import 'package:get/get.dart';

import '../model/survey_employee_model.dart';
import '../service/survey_employee_service.dart';

class SurveyEmployeeController extends GetxController {
  final SurveyEmployeeService service = SurveyEmployeeService();

  RxBool isLoading = false.obs;

  RxList<EmployeeData> employeeList = <EmployeeData>[].obs;

  RxList<EmployeeData> filteredList = <EmployeeData>[].obs;

  @override
  void onInit() {
    super.onInit();

    getEmployeeApi();
  }

  Future<void> getEmployeeApi() async {
    try {
      isLoading(true);

      final response = await service.getEmployees();

      if (response != null && response.status == true) {
        employeeList.assignAll(response.data ?? []);

        filteredList.assignAll(response.data ?? []);
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  /// SEARCH
  void searchEmployee(String value) {
    if (value.isEmpty) {
      filteredList.assignAll(employeeList);

      return;
    }

    filteredList.assignAll(
      employeeList.where((e) {
        return (e.fullName ?? "").toLowerCase().contains(value.toLowerCase()) ||
            (e.mobileNumber ?? "").contains(value);
      }).toList(),
    );
  }

  Future<void> refreshApi() async {
    await getEmployeeApi();
  }
}
