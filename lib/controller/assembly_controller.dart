import 'package:get/get.dart';

import '../model/assembly_model.dart';
import '../service/assembly_service.dart';

class AssemblyController extends GetxController {
  final AssemblyService _service = AssemblyService();

  RxList<AssemblyModel> assemblyList = <AssemblyModel>[].obs;

  RxnInt selectedAssemblyId = RxnInt();

  RxBool isLoading = false.obs;

  Future<void> getAssemblies(int districtId) async {
    try {
      isLoading.value = true;

      final response = await _service.getAssemblies(districtId);

      if (response.statusCode == 200) {
        assemblyList.value = (response.data as List)
            .map((e) => AssemblyModel.fromJson(e))
            .toList();
      }
    } finally {
      isLoading.value = false;
    }
  }
}
