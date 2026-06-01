import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voter_survey_admin/view/home_page/surveyEmp_details_screen.dart';

import '../../controller/survey_employee_controller.dart';
import '../../utils/appColors.dart';

class SurveyEmployeeScreen extends StatelessWidget {
  SurveyEmployeeScreen({super.key});
  final SurveyEmployeeController controller = Get.put(
    SurveyEmployeeController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      body: SafeArea(
        child: Column(
          children: [
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
                      "Survey Staff",

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
            SizedBox(height: 30),

            /// LIST
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),

                  itemCount: controller.filteredList.length,

                  itemBuilder: (context, index) {
                    final item = controller.filteredList[index];

                    return Container(
                      margin: const EdgeInsets.only(bottom: 7),

                      padding: const EdgeInsets.all(14),

                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.circular(22),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.03),
                            blurRadius: 10,
                          ),
                        ],
                      ),

                      child: Row(
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 32,

                                backgroundImage: NetworkImage(
                                  "https://www.aniltripathi.in${item.userImage}",
                                ),
                              ),
                              SizedBox(height: 7),
                              GestureDetector(
                                onTap: () {
                                  Get.to(
                                    () => SurveyEmployeeDetailsScreen(
                                      employeeId: item.id!,
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
                              SizedBox(height: 7),
                              GestureDetector(
                                onTap: () {
                                  // Get.to(
                                  //       () => SurveyEmployeeDetailsScreen(
                                  //     employeeId: item.id!,
                                  //   ),
                                  //);
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
                                    "Action",
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
                                detailTile("कर्मचारी का नाम", item.fullName),

                                detailTile(
                                  "कर्मचारी आईडी",
                                  item.id?.toString(),
                                ),

                                detailTile(
                                  "मोबाइल नंबर",
                                  item.mobileNumber ?? "N/A",
                                ),

                                detailTile(
                                  "पूर्ण किए गए गांव",
                                  item.completedVillageName ?? "N/A",
                                ),

                                detailTile(
                                  "लंबित गांव",
                                  item.pendingVillageName ?? "N/A",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget detailTile(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),

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
