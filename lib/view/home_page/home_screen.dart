import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voter_survey_admin/view/home_page/booth_management_screen.dart';
import 'package:voter_survey_admin/view/home_page/employee_management_screen.dart';
import 'package:voter_survey_admin/view/home_page/report_management_screen.dart';
import 'package:voter_survey_admin/view/profile_page/change_password_screen.dart';
import 'package:voter_survey_admin/view/profile_page/profile_screen.dart';
import 'package:voter_survey_admin/view/voting_page/voting_screen.dart';

import '../../controller/admin_profile_controller.dart';
import '../../controller/auth_controller.dart';
import '../../controller/condidate_voting_controller.dart';
import '../../controller/member_controller.dart';
import '../../controller/panchayat_list_controller.dart';
import '../../controller/survey_employee_controller.dart';
import '../../controller/today_survey_controllerdart.dart';
import '../../controller/total_survey_controller.dart';
import '../../utils/appColors.dart';
import '../compliaint_page/compliaint_screen.dart';
import '../login_screen.dart';
import '../profile_page/profile_info_screen.dart';

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
  final CandidateVoteReportController condidatecontroller = Get.put(
    CandidateVoteReportController(),
  );
  final MemberController memberController = Get.find<MemberController>();
  final AdminProfileController profileController = Get.put(
    AdminProfileController(),
  );

  @override
  void initState() {
    super.initState();
    loadDashboardData();
  }

  Future<void> loadDashboardData() async {
    await Future.wait(
      [
            memberController.getMemberApi(),
            controller.getEmployeeApi(),
            panchayatController.getPanchayatList(),
            todaySurveyController.getTodaySurveyApi(),
            condidatecontroller.fetchCandidateVoteReport(),
          ]
          as Iterable<Future<dynamic>>,
    );
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
        child: RefreshIndicator(
          onRefresh: loadDashboardData,
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

                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.05),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// MAIN MODULES
                      Row(
                        children: [
                          Icon(
                            Icons.dashboard_customize_rounded,
                            color: AppColors.saffron,
                            size: 22,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Main Modules",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 4,
                        mainAxisSpacing: 24,
                        crossAxisSpacing: 12,
                        childAspectRatio: .7,
                        children: [
                          phonePeItem(
                            title: "Employee",
                            icon: Icons.groups_rounded,
                            color: const Color(0xff1976D2),
                            onTap: () {
                              Get.to(() => EmployeeManagementScreen());
                            },
                          ),

                          phonePeItem(
                            title: "Reports",
                            icon: Icons.analytics_rounded,
                            color: const Color(0xff2E7D32),
                            onTap: () {
                              Get.to(() => const ReportManagementScreen());
                            },
                          ),

                          phonePeItem(
                            title: "Voting",
                            icon: Icons.how_to_vote_rounded,
                            color: AppColors.saffron,
                            onTap: () {
                              Get.to(() => const VotingScreen());
                            },
                          ),

                          phonePeItem(
                            title: "Booth",
                            icon: Icons.account_balance_rounded,
                            color: const Color(0xff673AB7),
                            onTap: () {
                              Get.to(() => const BoothManagementScreen());
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),

                /// QUICK OVERVIEW
                Row(
                  children: [
                    Icon(
                      Icons.fast_forward,
                      color: AppColors.saffron,
                      size: 22,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Quick Overview",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
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
                    /// Total Employee
                    Obx(
                      () => dashboardCard(
                        title: "Total Employee",
                        value: controller.employeeList.length.toString(),
                        subtitle: "कुल कर्मचारी",
                        icon: Icons.groups_2_rounded,
                        color: const Color(0xFF1976D2),
                      ),
                    ),

                    /// Total Report
                    Obx(
                      () => dashboardCard(
                        title: "Total Report",
                        value: panchayatController.totalPanchayat.value
                            .toString(),
                        subtitle: "कुल सर्वे",
                        icon: Icons.analytics_rounded,
                        color: const Color(0xFF43A047),
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
                      ),
                    ),

                    /// Voting
                    Obx(
                      () => dashboardCard(
                        title: "Total Voting",
                        value: condidatecontroller.totalVotes.value.toString(),
                        subtitle: "कुल मतदान",
                        icon: Icons.ballot_rounded,
                        color: AppColors.saffron,
                        onTap: () {
                          // Get.to(() => VotingScreen());
                        },
                      ),
                    ),

                    /// Booth Management
                    dashboardCard(
                      title: "Total Booth",
                      value: "6",
                      subtitle: "कुल बूथ",
                      icon: Icons.location_city_rounded,
                      color: const Color(0xFF673AB7),
                      onTap: () {
                        //   Get.to(() => const BoothManagementScreen());
                      },
                    ),
                    Obx(
                      () => dashboardCard(
                        title: "Total Member",
                        value: memberController.isLoading.value
                            ? "..."
                            : memberController.totalMember.value.toString(),
                        subtitle: "कुल सदस्य",
                        icon: Icons.event_note_rounded,
                        color: AppColors.secondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
              ],
            ),
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

  Widget dashboardItem({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: color.withOpacity(.15)),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(.04), blurRadius: 10),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 62,
              width: 62,
              decoration: BoxDecoration(
                color: color.withOpacity(.10),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 32, color: color),
            ),

            const SizedBox(height: 14),

            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }

  Widget phonePeItem({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 64,
            width: 64,
            decoration: BoxDecoration(
              color: color.withOpacity(.10),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 30),
          ),

          const SizedBox(height: 10),

          Text(
            title,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ],
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
  final AdminProfileController profileController =
      Get.find<AdminProfileController>();
  final List<Map<String, dynamic>> drawerItems = [
    {"icon": Icons.dashboard_customize_rounded, "title": "Dashboard"},

    {"icon": Icons.groups_rounded, "title": "Employee Management"},

    {"icon": Icons.analytics_rounded, "title": "Report Management"},

    {"icon": Icons.how_to_vote_rounded, "title": "Voting Overview"},

    {"icon": Icons.account_balance_rounded, "title": "Booth Management"},

    {"icon": Icons.campaign_rounded, "title": "Complaints Management"},

    // {"icon": Icons.newspaper_rounded, "title": "News & Updates"},
    {"icon": Icons.account_circle_rounded, "title": "Profile"},

    {"icon": Icons.settings_suggest_rounded, "title": "Settings"},

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
                GestureDetector(
                  onTap: () {
                    Get.to(() => const PersonalInfoScreen());
                  },
                  child: CircleAvatar(
                    radius: 36,
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/aniltri.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: Obx(() {
                    final profile = profileController.profile.value;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          profile?.adminName ?? "Admin",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          profile?.adminId ?? "Super Admin",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    );
                  }),
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
                    if (item["title"] == "Employee Management") {
                      Navigator.pop(context);

                      Get.to(() => EmployeeManagementScreen());

                      return;
                    }
                    if (item["title"] == "Report Management") {
                      Navigator.pop(context);

                      Get.to(() => ReportManagementScreen());

                      return;
                    }
                    if (item["title"] == "Voting Overview") {
                      Navigator.pop(context);

                      Get.to(() => VotingScreen());

                      return;
                    }
                    if (item["title"] == "Booth Management") {
                      Navigator.pop(context);

                      Get.to(() => BoothManagementScreen());

                      return;
                    }
                    if (item["title"] == "Complaints Management") {
                      Navigator.pop(context);

                      Get.to(() => ComplaintScreen());

                      return;
                    }
                    if (item["title"] == "Profile") {
                      Navigator.pop(context);

                      Get.to(() => ProfileScreen());

                      return;
                    }
                    if (item["title"] == "Settings") {
                      Navigator.pop(context);

                      Get.to(() => ChangePasswordScreen());

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
