import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/appColors.dart';
import '../dashbord_screen.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({super.key});

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  int selectedTab = 0;

  final List<String> tabs = ["सभी", "पेंडिंग", "प्रोसेस में", "रिजॉल्वड"];

  final List<Map<String, dynamic>> complaints = [
    {
      "title": "सड़क खराब है",
      "location": "मेहदावल",
      "date": "17 May 2024",
      "status": "पेंडिंग",
      "color": AppColors.orange,
      "bgColor": Color(0xffFFF3E0),
    },

    {
      "title": "पानी की समस्या",
      "location": "खलीलाबाद",
      "date": "17 May 2024",
      "status": "पेंडिंग",
      "color": AppColors.orange,
      "bgColor": Color(0xffFFF3E0),
    },

    {
      "title": "बिजली की समस्या",
      "location": "संत कबीर नगर",
      "date": "16 May 2024",
      "status": "प्रोसेस में",
      "color": AppColors.blue,
      "bgColor": Color(0xffE8F1FF),
    },

    {
      "title": "राशन नहीं मिल रहा",
      "location": "धनघटा",
      "date": "16 May 2024",
      "status": "रिजॉल्वड",
      "color": AppColors.green,
      "bgColor": Color(0xffE9F8EE),
    },

    {
      "title": "आवास योजना",
      "location": "बेलहर",
      "date": "15 May 2024",
      "status": "रिजॉल्वड",
      "color": AppColors.green,
      "bgColor": Color(0xffE9F8EE),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,

      floatingActionButton: Container(
        height: 64,
        width: 64,

        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          shape: BoxShape.circle,

          boxShadow: [
            BoxShadow(
              color: AppColors.saffron.withOpacity(0.35),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),

        child: FloatingActionButton(
          onPressed: () {},

          backgroundColor: Colors.transparent,
          elevation: 0,

          child: const Icon(Icons.add_rounded, size: 34, color: Colors.white),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [
              /// 🔥 TOP BAR
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
                        "Complaints",

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

              const SizedBox(height: 22),

              /// 🔥 SEARCH BAR
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 54,

                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(18),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 8,
                          ),
                        ],
                      ),

                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "सदस्य खोजे...",

                          hintStyle: const TextStyle(
                            color: AppColors.textLight,
                            fontSize: 14,
                          ),

                          prefixIcon: const Icon(
                            Icons.search_rounded,
                            color: AppColors.greyText,
                          ),

                          border: InputBorder.none,

                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Container(
                    height: 54,
                    width: 54,

                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(18),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 8,
                        ),
                      ],
                    ),

                    child: const Icon(
                      Icons.filter_alt_outlined,
                      color: AppColors.textDark,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              /// 🔥 STATUS TABS
              SizedBox(
                height: 45,

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tabs.length,

                  itemBuilder: (context, index) {
                    bool isSelected = selectedTab == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTab = index;
                        });
                      },

                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),

                        margin: const EdgeInsets.only(right: 10),

                        padding: const EdgeInsets.symmetric(horizontal: 24),

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
                    );
                  },
                ),
              ),

              const SizedBox(height: 15),

              /// 🔥 COMPLAINT LIST
              Expanded(
                child: ListView.builder(
                  itemCount: complaints.length,

                  itemBuilder: (context, index) {
                    final item = complaints[index];

                    return Container(
                      margin: const EdgeInsets.only(bottom: 6),

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

                      child: Row(
                        children: [
                          /// 🔥 LEFT DETAILS
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(
                                  item["title"],

                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.textDark,
                                  ),
                                ),

                                const SizedBox(height: 1),

                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      size: 16,
                                      color: AppColors.greyText,
                                    ),

                                    Expanded(
                                      child: Text(
                                        item["location"],

                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,

                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: AppColors.greyText,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 8),

                                Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_month,
                                      size: 16,
                                      color: AppColors.greyText,
                                    ),

                                    const SizedBox(width: 4),

                                    Text(
                                      item["date"],

                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: AppColors.greyText,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 12),

                          /// 🔥 STATUS BADGE
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 9,
                            ),

                            decoration: BoxDecoration(
                              color: item["bgColor"],
                              borderRadius: BorderRadius.circular(14),
                            ),

                            child: Text(
                              item["status"],

                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,

                                color: item["color"],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
