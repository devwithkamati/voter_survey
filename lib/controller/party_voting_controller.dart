import 'package:get/get.dart';

import '../model/party_voting_model.dart';
import '../service/party_voting_service.dart';

class PartyVoteReportController extends GetxController {
  RxBool isLoading = false.obs;

  RxList<PartyVoteModel> partyList = <PartyVoteModel>[].obs;

  RxInt totalVotes = 0.obs;

  Rx<PartyVoteSummary?> summary = Rx<PartyVoteSummary?>(null);

  @override
  void onInit() {
    fetchPartyVoteReport();
    super.onInit();
  }

  Future<void> fetchPartyVoteReport() async {
    try {
      isLoading.value = true;

      final response = await PartyVoteReportService.getPartyVoteReport();

      if (response != null) {
        partyList.assignAll(response.data);

        totalVotes.value = response.summary.totalVotes;

        summary.value = response.summary;
      }
    } finally {
      isLoading.value = false;
    }
  }
}
