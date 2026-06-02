import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voter_survey_admin/view/home_page/panchayat_list_screen.dart';

import '../../controller/booth_list_controller.dart';
import '../../controller/panchayat_list_controller.dart';
import '../../utils/appColors.dart';
import 'booth_list_screen.dart';

class BoothManagementScreen extends StatefulWidget {
  const BoothManagementScreen({super.key});

  @override
  State<BoothManagementScreen> createState() => _BoothManagementScreenState();
}

class _BoothManagementScreenState extends State<BoothManagementScreen> {
  final PanchayatController panchayatController = Get.put(
    PanchayatController(),
  );
  final BoothController boothController = Get.put(BoothController());

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
                              "Booth Management",

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
                  dashboardCard(
                    title: "Add Panchayat",
                    value: "1",
                    subtitle: "नई पंचायत जोड़ें",
                    icon: Icons.account_balance_rounded,
                    color: AppColors.primary,
                    onTap: () {
                      //   Get.to(() => AddSurveyStaffScreen());
                    },
                  ),
                  Obx(
                    () => dashboardCard(
                      title: "Panchayat List",
                      value: panchayatController.totalPanchayat.value
                          .toString(),
                      subtitle: "कुल पंचायत सूची",
                      icon: Icons.list_alt_rounded,
                      color: AppColors.saffron,
                      onTap: () => Get.to(() => PanchayatListScreen()),
                    ),
                  ),
                  dashboardCard(
                    title: "Add Booth",
                    value: "100",
                    subtitle: "नया बूथ जोड़ें",
                    icon: Icons.add_home_work_rounded,
                    color: AppColors.secondary,
                  ),

                  Obx(
                    () => dashboardCard(
                      title: "Booth List",
                      value: boothController.totalBooth.value.toString(),
                      subtitle: "कुल बूथ सूची",
                      icon: Icons.apartment_rounded,
                      color: AppColors.success,
                      onTap: () {
                        Get.to(() => BoothListScreen());
                      },
                    ),
                  ),

                  dashboardCard(
                    title: "Booth Members",
                    value: "2",
                    subtitle: "बूथ सदस्य विवरण",
                    icon: Icons.groups_rounded,
                    color: AppColors.yellow,
                  ),
                  dashboardCard(
                    title: "Panchayt Members",
                    value: "4",
                    subtitle: "पंचायत सदस्य विवरण",
                    icon: Icons.group_add_rounded,
                    color: AppColors.red,
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
