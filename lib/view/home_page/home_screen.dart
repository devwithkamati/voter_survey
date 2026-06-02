import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voter_survey_admin/view/home_page/add_survey_emp_screen.dart';
import 'package:voter_survey_admin/view/home_page/booth_management_screen.dart';
import 'package:voter_survey_admin/view/home_page/panchayat_list_screen.dart';
import 'package:voter_survey_admin/view/home_page/survey_emp_screen.dart';
import 'package:voter_survey_admin/view/home_page/today_survey_screen.dart';

import '../../controller/auth_controller.dart';
import '../../controller/panchayat_list_controller.dart';
import '../../controller/survey_employee_controller.dart';
import '../../controller/today_survey_controllerdart.dart';
import '../../controller/total_survey_controller.dart';
import '../../utils/appColors.dart';
import '../login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();
  final SurveyEmployeeController controller = Get.put(
    SurveyEmployeeController(),
  );
  final TotalSurveyController surveyController = Get.put(
    TotalSurveyController(),
  );
  final TodaySurveyController todaySurveyController = Get.put(
    TodaySurveyController(),
  );
  final PanchayatController panchayatController = Get.put(
    PanchayatController(),
  );

  // final MemberController memberController = Get.find<MemberController>();

  @override
  void initState() {
    super.initState();
    //  memberController.getMemberApi();

    controller.getEmployeeApi();
  }

  /// 🔥 DATE PICKER
  Future<void> pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,

      initialDate: selectedDate,

      firstDate: DateTime(2020),

      lastDate: DateTime(2035),

      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.saffron,
              onPrimary: Colors.white,
              onSurface: AppColors.textDark,
            ),
          ),

          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  /// 🔥 FORMAT DATE
  String formatDate(DateTime date) {
    List<String> months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];

    List<String> days = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday",
    ];

    return "${date.day} ${months[date.month - 1]} ${date.year}, ${days[date.weekday - 1]}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,

      drawer: const CustomDrawer(),

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
                              Scaffold.of(context).openDrawer();
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
                                Icons.menu_rounded,
                                size: 26,
                                color: AppColors.textDark,
                              ),
                            ),
                          ),

                          const SizedBox(width: 12),

                          Center(
                            child: const Text(
                              "Dashboard",

                              style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textDark,
                              ),
                            ),
                          ),
                        ],
                      ),

                      Stack(
                        children: [
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
                              Icons.notifications_none_rounded,
                              size: 26,
                              color: AppColors.textDark,
                            ),
                          ),

                          Positioned(
                            right: 3,
                            top: 3,

                            child: Container(
                              height: 16,
                              width: 16,

                              decoration: const BoxDecoration(
                                color: AppColors.red,
                                shape: BoxShape.circle,
                              ),

                              child: const Center(
                                child: Text(
                                  "2",

                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
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

              /// 🔥 DATE CARD
              GestureDetector(
                onTap: pickDate,

                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),

                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(18),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 10,
                      ),
                    ],
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text(
                        formatDate(selectedDate),

                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textDark,
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.all(7),

                        decoration: BoxDecoration(
                          color: AppColors.saffron.withOpacity(0.10),
                          borderRadius: BorderRadius.circular(10),
                        ),

                        child: const Icon(
                          Icons.calendar_month_rounded,
                          color: AppColors.saffron,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
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
                  Obx(
                    () => dashboardCard(
                      title: "Total Employee",

                      value: controller.employeeList.length.toString(),

                      subtitle: "कुल कर्मचारी",

                      icon: Icons.groups_rounded,

                      color: AppColors.blue,

                      onTap: () {
                        Get.to(() => SurveyEmployeeScreen());
                      },
                    ),
                  ),
                  dashboardCard(
                    title: "Add Employee",
                    subtitle: "नया पंजीकृत करें",
                    value: "",
                    icon: Icons.badge_rounded,
                    color: AppColors.primary,
                    onTap: () {
                      Get.to(() => AddSurveyStaffScreen());
                    },
                  ),
                  Obx(
                    () => dashboardCard(
                      title: "Total Report",
                      value: panchayatController.totalPanchayat.value
                          .toString(),
                      subtitle: "कुल सर्वे",

                      icon: Icons.list_alt_sharp,

                      color: AppColors.green,

                      onTap: () {
                        //   Get.to(() => const TotalSurveyListScreen());
                        Get.to(() => PanchayatListScreen());
                      },
                    ),
                  ),
                  Obx(
                    () => dashboardCard(
                      title: "Today Report",

                      value: todaySurveyController.todaySurveyCount.value
                          .toString(),
                      subtitle: "आज के सर्वे",

                      icon: Icons.today_rounded,

                      color: AppColors.green,

                      onTap: () {
                        Get.to(() => const TodaySurveyScreen());
                      },
                    ),
                  ),
                  dashboardCard(
                    title: "Voting",
                    value: "4,256",
                    subtitle: "कुल मतदान",
                    icon: Icons.how_to_vote_rounded,
                    color: AppColors.saffron,
                  ),

                  // Obx(
                  //   () => dashboardCard(
                  //     title: "Total Members",
                  //     value: memberController.isLoading.value
                  //         ? "..."
                  //         : memberController.totalMember.value.toString(),
                  //     subtitle: "कुल सदस्य",
                  //     icon: Icons.people_alt,
                  //     color: AppColors.secondary,
                  //     onTap: () => Get.to(() => const MemberScreen()),
                  //   ),
                  // ),

                  // dashboardCard(
                  //   title: "New Members",
                  //   value: "10",
                  //   subtitle: "नए सदस्य",
                  //   icon: Icons.person_add_outlined,
                  //   color: AppColors.success,
                  // ),

                  // dashboardCard(
                  //   title: "Complain and \n Suggestion",
                  //   value: "2",
                  //   subtitle: "कुल शिकायतें",
                  //   icon: Icons.feedback_rounded,
                  //   color: AppColors.yellow,
                  // ),
                  // dashboardCard(
                  //   title: "Pending Complaint",
                  //   value: "4",
                  //   subtitle: "लंबित शिकायतें",
                  //   icon: Icons.pending_actions_rounded,
                  //   color: AppColors.red,
                  // ),
                  dashboardCard(
                    title: "Booth Management",
                    value: "6",
                    subtitle: "बूथों का प्रबंधन",
                    icon: Icons.account_balance_rounded,
                    color: AppColors.darkBlue,
                    onTap: () {
                      Get.to(() => const BoothManagementScreen());
                    },
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

  /// 🔥 DASHBOARD CARD
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

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> drawerItems = [
    {"icon": Icons.dashboard_rounded, "title": "Dashboard"},

    {"icon": Icons.assignment_rounded, "title": "Survey Management"},

    {"icon": Icons.groups_rounded, "title": "Survey Employee"},

    {"icon": Icons.how_to_vote_rounded, "title": "Candidate Preference"},

    {"icon": Icons.card_membership_rounded, "title": "Membership Management"},

    {
      "icon": Icons.report_gmailerrorred_rounded,
      "title": "Complaint Management",
    },

    {"icon": Icons.newspaper_rounded, "title": "News & Updates"},

    {"icon": Icons.holiday_village_rounded, "title": "Booth Management"},

    {"icon": Icons.bar_chart_rounded, "title": "Reports"},

    {"icon": Icons.settings_rounded, "title": "Settings"},

    {"icon": Icons.logout_rounded, "title": "Logout"},
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.75,

      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(30)),
      ),

      child: Column(
        children: [
          /// 🔥 HEADER
          Container(
            width: double.infinity,

            padding: const EdgeInsets.only(
              top: 70,
              left: 20,
              right: 20,
              bottom: 18,
            ),

            decoration: const BoxDecoration(
              gradient: AppColors.primaryGradient,

              borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
            ),

            child: Row(
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundColor: Colors.white,

                  child: Padding(
                    padding: const EdgeInsets.all(6),

                    child: Image.asset("assets/images/bjp_logo.webp"),
                  ),
                ),

                const SizedBox(width: 14),

                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        "Admin",

                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(height: 2),

                      Text(
                        "Super Admin",

                        style: TextStyle(fontSize: 14, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          /// 🔥 MENU LIST
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),

              itemCount: drawerItems.length,

              itemBuilder: (context, index) {
                final item = drawerItems[index];

                final bool isSelected = selectedIndex == index;

                return GestureDetector(
                  onTap: () async {
                    setState(() {
                      selectedIndex = index;
                    });

                    /// DASHBOARD
                    if (item["title"] == "Dashboard") {
                      Navigator.pop(context);
                      return;
                    }

                    /// SURVEY EMPLOYEE
                    if (item["title"] == "Survey Employee") {
                      Navigator.pop(context);

                      Get.to(() => SurveyEmployeeScreen());

                      return;
                    }

                    /// LOGOUT
                    if (item["title"] == "Logout") {
                      bool? logout = await showDialog(
                        context: context,

                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22),
                            ),

                            title: const Text(
                              "Logout",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),

                            content: const Text(
                              "Are you sure you want to logout?",
                            ),

                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context, false);
                                },

                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(color: AppColors.greyText),
                                ),
                              ),

                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.saffron,

                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),

                                onPressed: () {
                                  Navigator.pop(context, true);
                                },

                                child: const Text(
                                  "Logout",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          );
                        },
                      );

                      if (logout == true) {
                        StorageService.logout();

                        Get.offAll(() => const LoginScreen());
                      }
                    }
                  },

                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),

                    margin: const EdgeInsets.only(bottom: 4),

                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 14,
                    ),

                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.saffron.withOpacity(0.10)
                          : Colors.transparent,

                      borderRadius: BorderRadius.circular(16),
                    ),

                    child: Row(
                      children: [
                        Icon(
                          item["icon"],

                          size: 24,

                          color: isSelected
                              ? AppColors.saffron
                              : AppColors.textDark,
                        ),

                        const SizedBox(width: 14),

                        Expanded(
                          child: Text(
                            item["title"],

                            style: TextStyle(
                              fontSize: 15.5,

                              fontWeight: isSelected
                                  ? FontWeight.w700
                                  : FontWeight.w500,

                              color: isSelected
                                  ? AppColors.saffron
                                  : AppColors.textDark,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
