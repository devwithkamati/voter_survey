import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voter_survey_admin/controller/emp_assignvillage_controller.dart';
import 'package:voter_survey_admin/view/home_page/emp_assignvillage_screen.dart';
import 'package:voter_survey_admin/view/home_page/emp_todaysurvey_screen.dart';

import '../../controller/assign_village_employe_controller.dart';
import '../../controller/emp_status_controller.dart';
import '../../controller/emp_todaysurvey_controller.dart';
import '../../controller/emp_totalsurvey_controller.dart';
import '../../controller/panchayat_list_controller.dart';
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
  final PanchayatController panchayatController =
      Get.find<PanchayatController>();
  final AssignVillageController assignVillageController = Get.put(
    AssignVillageController(),
  );

  final RxList<int> selectedPanchayatIds = <int>[].obs;
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
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.45,
                children: [
                  /// Panchayat List
                  Obx(
                    () => dashboardCard(
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
                    ),
                  ),

                  /// Add Employee
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
                  dashboardCard(
                    title: "Assign Village",
                    value: "-",
                    subtitle: "गांव आवंटित करें",
                    icon: Icons.location_city_rounded,
                    color: const Color(0xFF10B981), // Emerald Green
                    onTap: () {
                      showAssignVillageDialog();
                    },
                  ),

                  /// Add Employee
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

                  /// Booth List
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

  void showAssignVillageDialog() {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        child: Container(
          padding: const EdgeInsets.all(20),
          height: Get.height * .70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
          ),
          child: Column(
            children: [
              /// HEADER
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF10B981).withOpacity(.12),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.location_city_rounded,
                      color: Color(0xFF10B981),
                    ),
                  ),

                  const SizedBox(width: 12),

                  const Expanded(
                    child: Text(
                      "Assign Panchayat",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// LIST
              Expanded(
                child: Obx(() {
                  if (panchayatController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return ListView.separated(
                    itemCount: panchayatController.panchayatList.length,

                    separatorBuilder: (_, __) => const SizedBox(height: 10),

                    itemBuilder: (context, index) {
                      final item = panchayatController.panchayatList[index];

                      return Obx(() {
                        final isSelected = selectedPanchayatIds.contains(
                          item.id,
                        );

                        return InkWell(
                          borderRadius: BorderRadius.circular(18),
                          onTap: () {
                            if (isSelected) {
                              selectedPanchayatIds.remove(item.id);
                            } else {
                              selectedPanchayatIds.add(item.id!);
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xFF10B981).withOpacity(.08)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: isSelected
                                    ? const Color(0xFF10B981)
                                    : Colors.grey.shade200,
                              ),
                            ),
                            child: Row(
                              children: [
                                Checkbox(
                                  value: isSelected,
                                  activeColor: const Color(0xFF10B981),
                                  onChanged: (value) {
                                    if (isSelected) {
                                      selectedPanchayatIds.remove(item.id);
                                    } else {
                                      selectedPanchayatIds.add(item.id!);
                                    }
                                  },
                                ),

                                Expanded(
                                  child: Text(
                                    item.panchayatName ?? "",
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                    },
                  );
                }),
              ),

              const SizedBox(height: 15),

              /// ASSIGN BUTTON
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF10B981),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () async {
                    final success = await assignVillageController.assignVillage(
                      surveyerId: widget.employeeId,
                      villageIds: selectedPanchayatIds.toList(),
                    );

                    if (success) {
                      Get.back();

                      Get.snackbar("Success", "Village Assigned Successfully");
                    }
                  },
                  child: const Text(
                    "Assign Panchayat",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
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
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),

          border: Border.all(color: color.withOpacity(.08), width: 1),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.04),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            /// TOP ROW
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                ),

                Container(
                  height: 28,
                  width: 28,
                  decoration: BoxDecoration(
                    color: color.withOpacity(.08),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14,
                    color: color,
                  ),
                ),
              ],
            ),

            const Spacer(),

            /// BOTTOM CONTENT
            Row(
              children: [
                Container(
                  height: 54,
                  width: 54,

                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [color.withOpacity(.20), color.withOpacity(.08)],
                    ),

                    borderRadius: BorderRadius.circular(16),

                    border: Border.all(color: color.withOpacity(.15)),
                  ),

                  child: image != null
                      ? Padding(
                          padding: const EdgeInsets.all(12),
                          child: Image.asset(image),
                        )
                      : Icon(icon, color: color, size: 28),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        value.isEmpty ? "-" : value,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: AppColors.textDark,
                        ),
                      ),

                      const SizedBox(height: 3),

                      Text(
                        subtitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 11,
                          color: AppColors.greyText,
                          fontWeight: FontWeight.w500,
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
