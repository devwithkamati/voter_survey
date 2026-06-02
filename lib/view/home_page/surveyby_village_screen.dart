import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voter_survey_admin/view/home_page/surveybyvillage_details_screen.dart';

import '../../controller/survey_by_village_controller.dart';
import '../../utils/appColors.dart';

class SurveyByVillageScreen extends StatefulWidget {
  final int panchayatId;
  final String panchayatName;

  const SurveyByVillageScreen({
    super.key,
    required this.panchayatId,
    required this.panchayatName,
  });

  @override
  State<SurveyByVillageScreen> createState() => _SurveyByVillageScreenState();
}

class _SurveyByVillageScreenState extends State<SurveyByVillageScreen> {
  final SurveyByVillageController controller = Get.put(
    SurveyByVillageController(),
  );

  @override
  void initState() {
    super.initState();

    controller.getSurveyList(widget.panchayatId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [
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

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.03),
                            blurRadius: 8,
                          ),
                        ],
                      ),

                      child: const Icon(Icons.arrow_back_ios_rounded, size: 20),
                    ),
                  ),

                  Expanded(
                    child: Column(
                      children: [
                        const Text(
                          "Survey List",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 40),
                ],
              ),

              const SizedBox(height: 15),

              /// LIST
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (controller.surveyList.isEmpty) {
                    return const Center(child: Text("No Survey Found"));
                  }

                  return RefreshIndicator(
                    onRefresh: () async {
                      await controller.getSurveyList(widget.panchayatId);
                    },

                    child: ListView.builder(
                      itemCount: controller.surveyList.length,

                      itemBuilder: (context, index) {
                        final item = controller.surveyList[index];

                        final survey = item.surveyData;

                        return Container(
                          margin: const EdgeInsets.only(bottom: 7),
                          padding: const EdgeInsets.all(14),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(22),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.03),
                                blurRadius: 10,
                              ),
                            ],
                          ),

                          child: Row(
                            children: [
                              Column(
                                children: [
                                  CircleAvatar(
                                    radius: 38,

                                    backgroundImage:
                                        survey?.publicImage != null &&
                                            survey!.publicImage!.isNotEmpty
                                        ? NetworkImage(
                                            "https://aniltripathi.in${survey.publicImage}",
                                          )
                                        : null,

                                    child: survey?.publicImage == null
                                        ? const Icon(Icons.person)
                                        : null,
                                  ),

                                  const SizedBox(height: 20),

                                  GestureDetector(
                                    onTap: () {
                                      /// Survey Details Screen
                                      Get.to(
                                        () => SurveyByVillageDetailsScreen(
                                          surveyData: survey!,
                                          surveyEmployeeName:
                                              item.surveyEmployeeName ?? "",
                                        ),
                                      );
                                    },

                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 8,
                                      ),

                                      decoration: BoxDecoration(
                                        color: Colors.green.withOpacity(0.1),

                                        borderRadius: BorderRadius.circular(12),
                                      ),

                                      child: const Text(
                                        "View Details",
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(width: 12),

                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    detailTile(
                                      "मतदाता का नाम",
                                      survey?.voterName,
                                    ),

                                    detailTile("मोबाइल नंबर", survey?.mobileNo),

                                    detailTile("गांव", survey?.village),

                                    detailTile("बूथ संख्या", survey?.boothNo),

                                    detailTile(
                                      "सर्वे कर्मचारी",
                                      item.surveyEmployeeName,
                                    ),

                                    detailTile(
                                      "वोट दिया?",
                                      survey?.currentElectionParty,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget detailTile(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),

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

  Widget _badge(IconData icon, String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),

      decoration: BoxDecoration(
        color: color.withOpacity(.08),
        borderRadius: BorderRadius.circular(12),
      ),

      child: Row(
        children: [
          Icon(icon, size: 16, color: color),

          const SizedBox(width: 6),

          Expanded(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: color, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
