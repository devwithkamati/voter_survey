import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/survey_by_village_model.dart';
import '../../utils/appColors.dart';

class SurveyByVillageDetailsScreen extends StatelessWidget {
  final SurveyData surveyData;
  final String surveyEmployeeName;

  const SurveyByVillageDetailsScreen({
    super.key,
    required this.surveyData,
    required this.surveyEmployeeName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            const SizedBox(height: 40),

            /// APP BAR
            Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),

                  child: Container(
                    padding: const EdgeInsets.all(14),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),

                    child: const Icon(Icons.arrow_back_ios_rounded),
                  ),
                ),

                const Expanded(
                  child: Center(
                    child: Text(
                      "Survey Details",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 45),
              ],
            ),

            const SizedBox(height: 20),

            /// PROFILE CARD
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(24),
              ),

              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,

                    backgroundImage:
                        surveyData.publicImage != null &&
                            surveyData.publicImage!.isNotEmpty
                        ? NetworkImage(
                            "https://aniltripathi.in${surveyData.publicImage}",
                          )
                        : null,

                    child: surveyData.publicImage == null
                        ? const Icon(Icons.person, size: 40)
                        : null,
                  ),

                  const SizedBox(height: 12),

                  Text(
                    surveyData.voterName ?? "N/A",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    surveyData.mobileNo ?? "N/A",
                    style: const TextStyle(color: Colors.white70),
                  ),

                  const SizedBox(height: 12),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.15),
                      borderRadius: BorderRadius.circular(12),
                    ),

                    child: Text(
                      "Survey By : $surveyEmployeeName",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// BASIC INFO
            detailCard("Basic Information", [
              detailTile("Village", surveyData.village),
              detailTile("Booth No", surveyData.boothNo),
              detailTile("Occupation", surveyData.occupation),
              detailTile("Age", surveyData.age),
              detailTile("Gender", surveyData.gender),
              detailTile("Voter ID", surveyData.voterId),
              detailTile("Marital Status", surveyData.marriedOrUnMarried),
              detailTile("Birthday", formatDate(surveyData.birthDay)),

              detailTile("Anniversary", formatDate(surveyData.anniversary)),
            ]),

            /// POLITICAL SURVEY
            detailCard("Political Survey", [
              detailTile(
                "Last Election Vote",
                surveyData.lastElectionVotingParty,
              ),

              detailTile(
                "Current Election Party",
                surveyData.currentElectionParty,
              ),

              detailTile("Strongest Candidate", surveyData.strongestCandidate),

              detailTile("Winning Party", surveyData.winningParty),

              detailTile("Public Opinion", surveyData.publicOpinion),

              detailTile("Public Suggestion", surveyData.publicSuggestion),
            ]),

            /// MLA FEEDBACK
            detailCard("MLA Feedback", [
              detailTile("Work Done By MLA", surveyData.workDoneByMLA),

              detailTile("Satisfied Or Not", surveyData.satisfiedOrNot),

              detailTile("MLA Active", surveyData.isCurrentMLAActive),

              detailTile("MLA Win Again", surveyData.isMlaWinAgain),
            ]),

            /// FAMILY DETAILS
            detailCard("Family Information", [
              detailTile("Total Voters", surveyData.totalVoterInHouse),

              detailTile("Vote Decider", surveyData.voteDeciderName),

              detailTile("Vote Decider Contact", surveyData.voteDeciderContact),

              detailTile(
                "Vote Decider Occupation",
                surveyData.voteDeciderOccupation,
              ),
            ]),

            /// AREA FEEDBACK
            detailCard("Area Feedback", [
              detailTile("Public Problem", surveyData.publoicProblem),

              detailTile("Public Priority", surveyData.publicPriority),

              detailTile("Area Situation", surveyData.yourAreaSituation),

              detailTile("NDA Alliance Strong", surveyData.isNdaAllianceStrong),
            ]),
          ],
        ),
      ),
    );
  }

  String formatDate(String? date) {
    if (date == null || date.isEmpty) {
      return "N/A";
    }

    try {
      return DateFormat("dd MMM yyyy").format(DateTime.parse(date));
    } catch (e) {
      return date;
    }
  }

  Widget detailCard(String title, List<Widget> children) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
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
