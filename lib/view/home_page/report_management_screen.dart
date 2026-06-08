import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voter_survey_admin/view/home_page/panchayat_list_screen.dart';
import 'package:voter_survey_admin/view/home_page/today_survey_screen.dart';

import '../../controller/panchayat_list_controller.dart';
import '../../controller/today_survey_controllerdart.dart';
import '../../controller/total_survey_controller.dart';
import '../../utils/appColors.dart';

class ReportManagementScreen extends StatefulWidget {
  const ReportManagementScreen({super.key});

  @override
  State<ReportManagementScreen> createState() => _ReportManagementScreenState();
}

class _ReportManagementScreenState extends State<ReportManagementScreen> {
  final TotalSurveyController surveyController = Get.put(
    TotalSurveyController(),
  );
  final TodaySurveyController todaySurveyController = Get.put(
    TodaySurveyController(),
  );
  final PanchayatController panchayatController = Get.put(
    PanchayatController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
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
                              "Report Management",

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

              const SizedBox(height: 22),

              /// QUICK OVERVIEW
              Row(
                children: [
                  Icon(Icons.fast_forward, color: AppColors.saffron, size: 22),
                  SizedBox(width: 8),
                  Text(
                    "Quick Overview",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              /// 🔥 DASHBOARD CARDS
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1.45,
                children: [
                  /// Total Report
                  Obx(
                    () => dashboardCard(
                      title: "Total Report",
                      value: panchayatController.totalPanchayat.value
                          .toString(),
                      subtitle: "कुल सर्वे",
                      icon: Icons.analytics_rounded,
                      color: const Color(0xFF43A047),
                      onTap: () {
                        Get.to(() => PanchayatListScreen());
                      },
                    ),
                  ),

                  /// Today Report
                  Obx(
                    () => dashboardCard(
                      title: "Today Report",
                      value: todaySurveyController.todaySurveyCount.value
                          .toString(),
                      subtitle: "आज के सर्वे",
                      icon: Icons.event_note_rounded,
                      color: const Color(0xFFFF9800),
                      onTap: () {
                        Get.to(() => const TodaySurveyScreen());
                      },
                    ),
                  ),
                ],
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
