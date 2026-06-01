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

                          child: Row(
                            children: [
                              /// IMAGE
                              CircleAvatar(
                                radius: 32,

                                backgroundImage: NetworkImage(
                                  "https://aniltripathi.in${item.publicImage}",
                                ),
                              ),

                              const SizedBox(width: 12),

                              /// DETAILS
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text(
                                      item.voterName ?? "",

                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),

                                    const SizedBox(height: 3),

                                    Text(item.mobileNo ?? ""),

                                    const SizedBox(height: 2),

                                    Text(
                                      item.village ?? "",

                                      style: const TextStyle(
                                        color: AppColors.greyText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              /// BOOTH BADGE
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),

                                decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.10),

                                  borderRadius: BorderRadius.circular(12),
                                ),

                                child: Text(
                                  item.boothNo ?? "",

                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w700,
                                  ),
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
