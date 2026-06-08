import 'package:get/get.dart';

import '../model/condidate_voting_model.dart';
import '../service/condidate_voting_service.dart';

class CandidateVoteReportController extends GetxController {
  RxBool isLoading = false.obs;

  RxList<CandidateVoteModel> candidateList = <CandidateVoteModel>[].obs;

  RxInt totalVotes = 0.obs;
  Rx<VoteSummary?> summary = Rx<VoteSummary?>(null);

  @override
  void onInit() {
    fetchCandidateVoteReport();
    super.onInit();
  }

  Future<void> fetchCandidateVoteReport() async {
    try {
      isLoading.value = true;

      final response =
          await CandidateVoteReportService.getCandidateVoteReport();

      if (response != null) {
        candidateList.assignAll(response.data);

        totalVotes.value = response.summary.totalVotes;

        summary.value = response.summary;
      }
    } finally {
      isLoading.value = false;
    }
  }
}
