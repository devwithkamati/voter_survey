import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voter_survey_admin/view/profile_page/profile_info_screen.dart';

import '../../controller/admin_profile_controller.dart';
import '../../controller/auth_controller.dart';
import '../../utils/appColors.dart';
import '../dashbord_screen.dart';
import '../login_screen.dart';
import 'change_password_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AdminProfileController profileController =
      Get.find<AdminProfileController>();
  Widget premiumAppBarIcon(IconData icon) {
    return Container(
      height: 44,
      width: 44,

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),

        borderRadius: BorderRadius.circular(15),

        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),

      child: Icon(icon, color: Colors.white, size: 22),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),

        slivers: [
          /// ================= BODY =================
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15),

              child: Column(
                children: [
                  SizedBox(height: 50),
                  Builder(
                    builder: (context) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Row(
                            children: [
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
                                    size: 25,
                                    color: AppColors.textDark,
                                  ),
                                ),
                              ),

                              const SizedBox(width: 12),

                              Center(
                                child: const Text(
                                  "My Profile",

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

                  SizedBox(height: 20),

                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.03),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 95,
                          width: 95,
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
                            ),
                          ),
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                "assets/images/aniltri.jpeg",
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),

                        Obx(() {
                          if (profileController.isLoading.value) {
                            return const CircularProgressIndicator();
                          }

                          return Text(
                            profileController.profile.value?.adminName ??
                                "Admin",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  /// ================= PERSONAL =================
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.05),
                          blurRadius: 25,
                          offset: const Offset(0, 10),
                        ),
                      ],
                      border: Border.all(color: const Color(0xFFF1F3F6)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        profileTile(
                          color: const Color(0xFF7B4DFF),
                          icon: Icons.person_outline_rounded,
                          title: "Personal Info",
                          subTitle: "Name, contact, address",
                          onTap: () {
                            Get.to(() => const PersonalInfoScreen());
                          },
                        ),

                        // const SizedBox(height: 10),
                        //
                        // profileTile(
                        //   color: const Color(0xFF2196F3),
                        //   icon: Icons.badge_outlined,
                        //   title: "Surveyor Details",
                        //   subTitle: "ID : SV12345 | Block : Sikanderpur",
                        //   onTap: () {},
                        // ),
                        const SizedBox(height: 10),

                        profileTile(
                          color: const Color(0xFFFF9800),
                          icon: Icons.settings_outlined,
                          title: "Settings",
                          subTitle: "Change Password",
                          onTap: () {
                            Get.to(() => const ChangePasswordScreen());
                          },
                        ),

                        const SizedBox(height: 10),

                        profileTile(
                          color: const Color(0xFF607D8B),
                          icon: Icons.help_outline_rounded,
                          title: "Help & Support",
                          subTitle: "FAQs and contact support",
                          onTap: () {},
                        ),

                        const SizedBox(height: 10),

                        profileTile(
                          color: const Color(0xFFFF4B4B),
                          icon: Icons.logout_rounded,
                          title: "Logout",
                          subTitle: "Sign out from account",
                          onTap: () {
                            showLogoutDialog();
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 36),

                  /// ================= FOOTER =================
                  Text(
                    "Voter Survey App v1.0.0",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Made with ❤️ for Democracy",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showLogoutDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Row(
            children: [
              Icon(Icons.logout_rounded, color: Colors.red),
              SizedBox(width: 10),
              Text("Logout"),
            ],
          ),
          content: const Text(
            "Are you sure you want to logout from your account?",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text("Cancel"),
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                /// Clear Storage
                StorageService.logout();

                /// Close Dialog
                Get.back();

                /// Go Login Screen
                Get.offAll(() => const LoginScreen());
              },
              child: const Text("Logout"),
            ),
          ],
        );
      },
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 12),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
          color: Colors.grey.shade600,
        ),
      ),
    );
  }

  /// ================= PROFILE TILE =================
  Widget profileTile({
    required Color color,
    required IconData icon,
    required String title,
    required String subTitle,
    required VoidCallback onTap,
  }) {
    final bool isLogout = title == "Logout";

    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isLogout ? const Color(0xFFFFF5F5) : Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isLogout ? const Color(0xFFFFDADA) : const Color(0xFFF0F2F5),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.04),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 54,
              width: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: LinearGradient(
                  colors: [color, color.withOpacity(.85)],
                ),
              ),
              child: Icon(icon, color: Colors.white, size: 26),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    subTitle,
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),

            Container(
              height: 36,
              width: 36,
              decoration: BoxDecoration(
                color: const Color(0xFFF4F6FA),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.arrow_forward_ios_rounded, size: 14),
            ),
          ],
        ),
      ),
    );
  }
}
