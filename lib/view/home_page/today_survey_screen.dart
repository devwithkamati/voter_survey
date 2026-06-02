import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/today_survey_controllerdart.dart';
import '../../utils/appColors.dart';

class TodaySurveyScreen extends StatelessWidget {
  const TodaySurveyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TodaySurveyController controller = Get.find<TodaySurveyController>();

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
                  /// 🔥 BACK BUTTON
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },

                    child: Container(
                      padding: const EdgeInsets.all(15),

                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(14),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 8,
                          ),
                        ],
                      ),

                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 20,
                        color: AppColors.textDark,
                      ),
                    ),
                  ),

                  /// 🔥 CENTER TITLE
                  Expanded(
                    child: Center(
                      child: const Text(
                        "Today Survey List",

                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textDark,
                        ),
                      ),
                    ),
                  ),

                  /// 🔥 RIGHT SIDE SPACE
                  const SizedBox(width: 38),
                ],
              ),

              SizedBox(height: 20),

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
                    onRefresh: () => controller.getTodaySurveyApi(),

                    child: ListView.builder(
                      itemCount: controller.surveyList.length,

                      itemBuilder: (context, index) {
                        final item = controller.surveyList[index];

                        return Container(
                          margin: const EdgeInsets.only(bottom: 8),

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

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    radius: 32,
                                    backgroundImage: NetworkImage(
                                      "https://aniltripathi.in${item.publicImage}",
                                    ),
                                  ),

                                  const SizedBox(width: 12),

                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,

                                      children: [
                                        /// नाम
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 70,
                                              child: Text(
                                                "नाम :",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.greyText,
                                                ),
                                              ),
                                            ),

                                            Expanded(
                                              child: Text(
                                                "${item.voterName ?? "N/A"}",
                                                style: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                        const SizedBox(height: 6),

                                        /// मोबाइल नंबर
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 70,
                                              child: Text(
                                                "मोबाइल :",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.greyText,
                                                ),
                                              ),
                                            ),

                                            Expanded(
                                              child: Text(
                                                "${item.mobileNo ?? "N/A"}",
                                              ),
                                            ),
                                          ],
                                        ),

                                        const SizedBox(height: 6),

                                        /// गांव
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              width: 70,
                                              child: Text(
                                                "गांव :",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.greyText,
                                                ),
                                              ),
                                            ),

                                            Expanded(
                                              child: Text(
                                                "${item.village ?? "N/A"}",
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 12),

                              Container(
                                width: double.infinity,

                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 10,
                                ),

                                decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.10),

                                  borderRadius: BorderRadius.circular(12),
                                ),

                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.how_to_vote_rounded,
                                      color: Colors.green,
                                      size: 18,
                                    ),

                                    const SizedBox(width: 8),

                                    Expanded(
                                      child: Text(
                                        item.boothNo ?? "",

                                        maxLines: 2,

                                        overflow: TextOverflow.ellipsis,

                                        style: const TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
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
}
