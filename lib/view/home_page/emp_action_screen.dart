import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voter_survey_admin/controller/emp_assignvillage_controller.dart';
import 'package:voter_survey_admin/view/home_page/emp_assignvillage_screen.dart';
import 'package:voter_survey_admin/view/home_page/emp_todaysurvey_screen.dart';

import '../../controller/emp_status_controller.dart';
import '../../controller/emp_todaysurvey_controller.dart';
import '../../controller/emp_totalsurvey_controller.dart';
import '../../utils/appColors.dart';
import 'emp_total_survey_screen.dart';

class EmpActionScreen extends StatefulWidget {
  final int employeeId;

  const EmpActionScreen({super.key, required this.employeeId});

  @override
  State<EmpActionScreen> createState() => _EmpActionScreenState();
}

class _EmpActionScreenState extends State<EmpActionScreen> {
  final assignedVillageController = Get.put(AssignedVillageController());
  final emptodaySurveyController = Get.put(EmpTodaySurveyController());
  final EmployeeSurveyController controller = Get.put(
    EmployeeSurveyController(),
  );
  final EmployeeStatusController statusController = Get.put(
    EmployeeStatusController(),
  );
  bool isActive = true;

  @override
  void initState() {
    super.initState();

    assignedVillageController.fetchAssignedVillage(widget.employeeId);

    controller.fetchEmployeeSurvey(widget.employeeId);

    emptodaySurveyController.fetchTodaySurvey(widget.employeeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              /// 🔥 TOP BAR
              Builder(
                builder: (context) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },

                            child: Container(
                              padding: const EdgeInsets.all(9),

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
                                size: 26,
                                color: AppColors.textDark,
                              ),
                            ),
                          ),

                          const SizedBox(width: 12),

                          Center(
                            child: const Text(
                              "Action",

                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textDark,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 18),

              /// 🔥 DASHBOARD CARDS
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),

                crossAxisSpacing: 8,
                mainAxisSpacing: 8,

                childAspectRatio: 1.50,
                children: [
                  Obx(() {
                    return dashboardCard(
                      title: "Today Survey Report",
                      subtitle: "आज का सर्वे",
                      value: emptodaySurveyController.totalTodaySurvey.value
                          .toString(),
                      icon: Icons.badge_rounded,
                      color: AppColors.primary,

                      onTap: () {
                        Get.to(
                          () => EmpTodaySurveyScreen(
                            employeeId: widget.employeeId,
                          ),
                        );
                      },
                    );
                  }),

                  Obx(
                    () => dashboardCard(
                      title: "Total Survey Report",
                      value: controller.totalSurveyCount.value.toString(),
                      subtitle: "कुल सर्वे",
                      icon: Icons.how_to_vote_rounded,
                      color: AppColors.saffron,
                      onTap: () {
                        Get.to(
                          () => EmpTotalSurveyScreen(
                            employeeId: widget.employeeId,
                          ),
                        );
                      },
                    ),
                  ),

                  Obx(
                    () => dashboardCard(
                      title: "Allocated Village",
                      value: assignedVillageController
                          .totalAssignedVillage
                          .value
                          .toString(),
                      subtitle: "आवंटित गांव",
                      icon: Icons.account_balance_rounded,
                      color: AppColors.darkBlue,
                      onTap: () {
                        Get.to(
                          () => EmpVillageScreen(employeeId: widget.employeeId),
                        );
                      },
                    ),
                  ),

                  // Container(
                  //   padding: const EdgeInsets.all(14),
                  //   decoration: BoxDecoration(
                  //     color: AppColors.white,
                  //     borderRadius: BorderRadius.circular(22),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.black.withOpacity(0.03),
                  //         blurRadius: 10,
                  //       ),
                  //     ],
                  //   ),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       const Text(
                  //         "Member Status",
                  //         style: TextStyle(
                  //           fontSize: 14,
                  //           fontWeight: FontWeight.w600,
                  //         ),
                  //       ),
                  //
                  //       Center(
                  //         child: Switch(
                  //           value: isActive,
                  //           activeColor: Colors.green,
                  //           onChanged: (value) {
                  //             setState(() {
                  //               isActive = value;
                  //             });
                  //           },
                  //         ),
                  //       ),
                  //
                  //       Text(
                  //         isActive ? "Active" : "Deactive",
                  //         style: TextStyle(
                  //           color: isActive ? Colors.green : Colors.red,
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 16,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Obx(
                    () => Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: AppColors.white,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          const Text(
                            "Member Status",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          Center(
                            child: statusController.isLoading.value
                                ? const CircularProgressIndicator()
                                : Switch(
                                    value: statusController.currentStatus.value,

                                    activeColor: Colors.green,

                                    onChanged: (value) {
                                      statusController.updateEmployeeStatus(
                                        employeeId: widget.employeeId,
                                        isActive: value,
                                      );
                                    },
                                  ),
                          ),

                          Text(
                            statusController.currentStatus.value
                                ? "Active"
                                : "Deactive",

                            style: TextStyle(
                              color: statusController.currentStatus.value
                                  ? Colors.green
                                  : Colors.red,

                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: InkWell(
                  onTap: () {
                    // Future Edit Feature
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.saffron,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.edit, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          "Edit",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  Widget dashboardCard({
    required String title,
    required String value,
    required String subtitle,
    required Color color,
    VoidCallback? onTap,

    IconData? icon,
    String? image,
  }) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        padding: const EdgeInsets.all(14),

        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(22),

          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text(
              title,

              maxLines: 2,
              overflow: TextOverflow.ellipsis,

              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textDark,
              ),
            ),

            Row(
              children: [
                Container(
                  height: 45,
                  width: 45,

                  decoration: BoxDecoration(
                    color: color.withOpacity(0.10),
                    shape: BoxShape.circle,
                  ),

                  child: image != null
                      ? Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(image),
                        )
                      : Icon(icon, color: color, size: 24),
                ),

                const SizedBox(width: 10),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        value,

                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,

                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                      ),

                      const SizedBox(height: 2),

                      Text(
                        subtitle,

                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,

                        style: const TextStyle(
                          fontSize: 11.5,
                          color: AppColors.greyText,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
