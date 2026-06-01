import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/total_survey_controller.dart';
import '../../utils/appColors.dart';

class SurveyDetailsScreen extends StatelessWidget {
  final int surveyId;

  const SurveyDetailsScreen({super.key, required this.surveyId});

  @override
  Widget build(BuildContext context) {
    final TotalSurveyController controller = Get.find<TotalSurveyController>();

    final survey = controller.surveyList.firstWhere((e) => e.id == surveyId);

    return Scaffold(
      backgroundColor: AppColors.lightBackground,

      // appBar: AppBar(
      //   centerTitle: true,
      //   title: const Text("Survey Details"),
      //   backgroundColor: AppColors.saffron,
      //   foregroundColor: Colors.white,
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40),

            /// APP BAR
            Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),

                  child: Container(
                    padding: const EdgeInsets.all(15),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),

                    child: const Icon(Icons.arrow_back_ios_rounded, size: 20),
                  ),
                ),

                const Expanded(
                  child: Center(
                    child: Text(
                      "सर्वे की जानकारी",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 40),
              ],
            ),

            const SizedBox(height: 20),

            /// PROFILE CARD
            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        survey.publicImage != null &&
                            survey.publicImage!.isNotEmpty
                        ? NetworkImage(
                            "https://aniltripathi.in${survey.publicImage}",
                          )
                        : null,
                    child: survey.publicImage == null
                        ? const Icon(Icons.person, size: 40)
                        : null,
                  ),

                  const SizedBox(height: 12),

                  Text(
                    survey.voterName ?? "N/A",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),

                  Text(
                    survey.mobileNo ?? "N/A",
                    style: const TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            detailCard("सर्वे विवरण", [
              detailTile("आईडी", survey.id.toString()),
              detailTile("मतदाता का नाम", survey.voterName),
              detailTile("मोबाइल नंबर", survey.mobileNo),
              detailTile("गांव", survey.village),
              detailTile("बूथ संख्या", survey.boothNo),

              detailTile("व्यवसाय", survey.occupation),
              detailTile("मतदाता पहचान पत्र", survey.voterId),
              detailTile("आयु", survey.age),
              detailTile("लिंग", survey.gender),

              detailTile(
                "विधानसभा में बेहतर कार्य",
                survey.workBetterInAssembly,
              ),

              detailTile("संतुष्ट या नहीं", survey.satisfiedOrNot),

              detailTile("विधायक द्वारा किए गए कार्य", survey.workDoneByMLA),

              detailTile("क्या विधायक फिर से जीतेंगे", survey.isMlaWinAgain),

              detailTile("सबसे मजबूत उम्मीदवार", survey.strongestCandidate),

              detailTile(
                "उम्मीदवार से मिलना आसान है",
                survey.easyToMeetCandidate,
              ),

              detailTile("उम्मीदवार की छवि", survey.candidateProfile),

              detailTile("जीतने की संभावना", survey.winingPotential),

              detailTile("जनता का वोट", survey.publicVote),

              detailTile("जनता की राय", survey.publicOpinion),

              detailTile("पार्टी की स्थिति", survey.partySituation),

              detailTile("जनता के सुझाव", survey.publicSuggestion),

              detailTile("श्रेणी", survey.category),

              detailTile("क्या मतदान करेंगे", survey.isVoting),

              detailTile(
                "पिछले चुनाव में वोट दिया",
                survey.lastElectionVotingParty,
              ),

              detailTile("वर्तमान चुनाव पार्टी", survey.currentElectionParty),

              detailTile(
                "क्या वर्तमान विधायक से संतुष्ट हैं",
                survey.isPublicSatisfiedFromCurrentMLA,
              ),

              detailTile("जनता की प्राथमिकता", survey.publicPriority),

              detailTile(
                "समस्या समाधान करने वाला उम्मीदवार",
                survey.problemSolvingCandidate,
              ),

              detailTile(
                "मुश्किल समय में जनता के साथ कौन खड़ा रहता है",
                survey.whoStandWithPublicInBadSituation,
              ),

              detailTile(
                "क्या वर्तमान विधायक सक्रिय हैं",
                survey.isCurrentMLAActive,
              ),

              detailTile("लोग किससे मिलते हैं", survey.meetingPeopleWith),

              detailTile(
                "क्या वर्तमान सरकार से संतुष्ट हैं",
                survey.satisfiedWithPresentGovernmmentOrNot,
              ),

              detailTile("जीतने वाली पार्टी", survey.winningParty),

              detailTile("घर में कुल मतदाता", survey.totalVoterInHouse),

              detailTile(
                "घर में वोट का निर्णय कौन करता है",
                survey.voteDeciderInHouse,
              ),

              detailTile("निर्णय लेने वाले का नाम", survey.voteDeciderName),

              detailTile(
                "निर्णय लेने वाले का संपर्क",
                survey.voteDeciderContact,
              ),

              detailTile(
                "निर्णय लेने वाले का व्यवसाय",
                survey.voteDeciderOccupation,
              ),

              detailTile("गांव आईडी", survey.villageId.toString()),

              detailTile(
                "सर्वे कर्मचारी आईडी",
                survey.surveyEmployeeId.toString(),
              ),

              detailTile("जनता की समस्या", survey.publoicProblem),

              detailTile(
                "लोग किस प्रकार के उम्मीदवार को पसंद करते हैं",
                survey.whichTypeCandidatePeoplePrefer,
              ),

              detailTile(
                "यदि आज चुनाव हो तो आप किसे वोट देंगे",
                survey.ifTodayElectionHappenWhoseYouVote,
              ),

              detailTile("आपके क्षेत्र की स्थिति", survey.yourAreaSituation),

              detailTile(
                "क्या एनडीए गठबंधन मजबूत है",
                survey.isNdaAllianceStrong,
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget detailCard(String title, List<Widget> children) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.saffron,
            ),
          ),

          const SizedBox(height: 12),

          ...children,
        ],
      ),
    );
  }

  Widget detailTile(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),

      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),

          Expanded(flex: 5, child: Text(value ?? "N/A")),
        ],
      ),
    );
  }
}
