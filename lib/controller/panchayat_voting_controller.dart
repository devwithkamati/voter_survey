import 'package:get/get.dart';

import '../model/panchayat_voting_model.dart';
import '../service/panchayat_voting_service.dart';

class PanchayatVoteReportController extends GetxController {
  RxBool isLoading = false.obs;

  RxList<PanchayatVoteModel> panchayatList = <PanchayatVoteModel>[].obs;

  RxInt totalVotes = 0.obs;

  Rx<PanchayatVoteSummary?> summary = Rx<PanchayatVoteSummary?>(null);

  @override
  void onInit() {
    fetchPanchayatVoteReport();
    super.onInit();
  }

  Future<void> fetchPanchayatVoteReport() async {
    try {
      isLoading.value = true;

      final response =
          await PanchayatVoteReportService.getPanchayatVoteReport();

      if (response != null) {
        panchayatList.assignAll(response.data);

        totalVotes.value = response.summary.totalVotes;

        summary.value = response.summary;
      }
    } finally {
      isLoading.value = false;
    }
  }
}
