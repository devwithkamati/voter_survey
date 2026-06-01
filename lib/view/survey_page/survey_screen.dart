import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voter_survey_admin/view/dashbord_screen.dart';

import '../../utils/appColors.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  int selectedTab = 0;

  final List<String> tabs = ["इस माह", "इस सप्ताह", "इस वर्ष"];

  final List<Map<String, dynamic>> candidates = [
    {
      "name": "अनिल त्रिपाठी",
      "votes": "4,256",
      "height": 150.0,
      "color": AppColors.saffron,
      "image": "assets/images/aniltri.jpeg",
    },

    {
      "name": "रवि शंकर",
      "votes": "2,845",
      "height": 118.0,
      "color": AppColors.green,
      "image": "assets/images/anil.jpeg",
    },

    {
      "name": "सुदीप वर्मा",
      "votes": "1,756",
      "height": 88.0,
      "color": AppColors.blue,
      "image": "assets/images/bjp_logo.webp",
    },

    {
      "name": "प्रकाश सिंह",
      "votes": "965",
      "height": 60.0,
      "color": Colors.purple,
      "image": "assets/images/anil.jpeg",
    },

    {
      "name": "अन्य",
      "votes": "636",
      "height": 42.0,
      "color": AppColors.orange,
      "image": "assets/images/bjp_logo.webp",
    },
  ];

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Row(
                    children: [
                      /// 🔥 BACK BUTTON
                      GestureDetector(
                        onTap: () {
                          Get.offAll(() => DashBoardScreen());
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
                            Icons.arrow_back_ios_new_rounded,
                            size: 20,
                            color: AppColors.textDark,
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      const Text(
                        "Survey Overview",

                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textDark,
                        ),
                      ),
                    ],
                  ),

                  Container(
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
                      Icons.filter_alt_outlined,
                      size: 22,
                      color: AppColors.textDark,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              /// 🔥 TAB BUTTONS
              Row(
                children: List.generate(tabs.length, (index) {
                  bool isSelected = selectedTab == index;

                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTab = index;
                        });
                      },

                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),

                        margin: EdgeInsets.only(right: index != 2 ? 10 : 0),

                        padding: const EdgeInsets.symmetric(vertical: 13),

                        decoration: BoxDecoration(
                          gradient: isSelected
                              ? AppColors.primaryGradient
                              : null,

                          color: isSelected ? null : AppColors.white,

                          borderRadius: BorderRadius.circular(16),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.03),
                              blurRadius: 8,
                            ),
                          ],
                        ),

                        child: Center(
                          child: Text(
                            tabs[index],

                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,

                              color: isSelected
                                  ? Colors.white
                                  : AppColors.textDark,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 22),

              /// 🔥 CHART CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),

                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(24),

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
                    const Text(
                      "कौन से उम्मीदवार को कितने लोग पसंद कर रहे हैं",

                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDark,
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// 🔥 BAR CHART
                    SizedBox(
                      height: 300,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,

                        children: List.generate(candidates.length, (index) {
                          final item = candidates[index];

                          return Column(
                            mainAxisAlignment: MainAxisAlignment.end,

                            children: [
                              Text(
                                item["votes"],

                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 10),

                              Container(
                                width: 38,
                                height: item["height"],

                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,

                                    colors: [
                                      item["color"],
                                      item["color"].withOpacity(0.75),
                                    ],
                                  ),

                                  borderRadius: BorderRadius.circular(14),

                                  boxShadow: [
                                    BoxShadow(
                                      color: item["color"].withOpacity(0.25),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 12),

                              /// 🔥 IMAGE
                              Container(
                                height: 50,
                                width: 50,

                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  shape: BoxShape.circle,

                                  border: Border.all(
                                    color: AppColors.border,
                                    width: 1.2,
                                  ),

                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.04),
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),

                                child: Padding(
                                  padding: const EdgeInsets.all(3),

                                  child: ClipOval(
                                    child: Image.asset(
                                      item["image"],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 8),

                              SizedBox(
                                width: 60,

                                child: Text(
                                  item["name"],

                                  textAlign: TextAlign.center,

                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              /// 🔥 REPORT CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),

                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(24),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    reportTile(title: "Total Survey", value: "12,458"),

                    reportTile(
                      title: "Complete Survey",
                      value: "9,856 (79.2%)",
                      valueColor: AppColors.green,
                    ),

                    reportTile(
                      title: "Incomplete Survey",
                      value: "2,602 (20.8%)",
                      valueColor: AppColors.saffron,
                    ),

                    reportTile(title: "Today Survey", value: "326"),
                  ],
                ),
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔥 REPORT TILE
  Widget reportTile({
    required String title,
    required String value,

    Color valueColor = AppColors.textDark,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),

      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.border.withOpacity(0.6)),
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Text(
            title,

            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.textDark,
            ),
          ),

          Text(
            value,

            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}
