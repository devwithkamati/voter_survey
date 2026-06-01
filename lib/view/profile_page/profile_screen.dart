import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/appColors.dart';
import '../dashbord_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
              padding: const EdgeInsets.all(4),

              child: Column(
                children: [
                  /// ================= PREMIUM APP BAR =================
                  /// ================= PREMIUM WHITE APP BAR =================
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),

                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius: BorderRadius.circular(22),

                      boxShadow: [
                        BoxShadow(
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                          color: Colors.black.withOpacity(0.04),
                        ),
                      ],
                    ),

                    child: SafeArea(
                      bottom: false,

                      child: Row(
                        children: [
                          /// BACK BUTTON
                          GestureDetector(
                            onTap: () {
                              Get.offAll(() => DashBoardScreen());
                            },

                            child: Container(
                              height: 42,
                              width: 42,

                              decoration: BoxDecoration(
                                color: const Color(0xFFF5F7FB),

                                borderRadius: BorderRadius.circular(14),
                              ),

                              child: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: AppColors.textDark,
                                size: 18,
                              ),
                            ),
                          ),

                          /// TITLE
                          const Expanded(
                            child: Center(
                              child: Text(
                                "My Profile",

                                style: TextStyle(
                                  color: AppColors.textDark,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),

                          /// EDIT BUTTON
                          Container(
                            height: 42,
                            width: 42,

                            decoration: BoxDecoration(
                              color: const Color(0xFFF5F7FB),

                              borderRadius: BorderRadius.circular(14),
                            ),

                            child: const Icon(
                              Icons.edit_rounded,
                              color: AppColors.textDark,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// ================= PERSONAL =================
                  premiumSection(
                    children: [
                      profileTile(
                        color: const Color(0xFF7B4DFF),
                        icon: Icons.person_outline_rounded,
                        title: "Personal Info",
                        subTitle: "Name, contact, address",
                        onTap: () {
                          //  Get.to(const PersonalInfoScreen());
                        },
                      ),

                      divider(),

                      profileTile(
                        color: const Color(0xFF2196F3),
                        icon: Icons.badge_outlined,
                        title: "Surveyor Details",
                        subTitle: "ID : SV12345 | Block : Sikanderpur",
                        onTap: () {
                          // Get.to(const PersonalInfoScreen());
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  /// ================= PERFORMANCE =================
                  premiumSection(
                    children: [
                      profileTile(
                        color: const Color(0xFFFF9800),
                        icon: Icons.settings_outlined,
                        title: "Settings",
                        subTitle: "Language, notifications, theme",
                        onTap: () {
                          // Get.to(const PersonalInfoScreen());
                        },
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  /// ================= SUPPORT =================
                  premiumSection(
                    children: [
                      profileTile(
                        color: const Color(0xFF607D8B),
                        icon: Icons.help_outline_rounded,
                        title: "Help & Support",
                        subTitle: "FAQs and contact support",
                        onTap: () {
                          // Get.to(const PersonalInfoScreen());
                        },
                      ),

                      divider(),

                      profileTile(
                        color: const Color(0xFFFF4B4B),
                        icon: Icons.logout_rounded,
                        title: "Logout",
                        subTitle: "Sign out from account",

                        onTap: () {
                          showDialog(
                            context: context,

                            barrierDismissible: false,

                            builder: (context) {
                              return Dialog(
                                backgroundColor: Colors.transparent,

                                child: Container(
                                  padding: const EdgeInsets.all(24),

                                  decoration: BoxDecoration(
                                    color: Colors.white,

                                    borderRadius: BorderRadius.circular(30),

                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 25,

                                        color: Colors.black.withOpacity(0.12),

                                        offset: const Offset(0, 10),
                                      ),
                                    ],
                                  ),

                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,

                                    children: [
                                      /// LOGOUT ICON
                                      Container(
                                        height: 70,
                                        width: 70,

                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,

                                          gradient: LinearGradient(
                                            colors: [
                                              Colors.red.shade400,
                                              Colors.red.shade600,
                                            ],
                                          ),

                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 18,

                                              color: Colors.red.withOpacity(
                                                0.25,
                                              ),

                                              offset: const Offset(0, 8),
                                            ),
                                          ],
                                        ),

                                        child: const Icon(
                                          Icons.logout_rounded,

                                          color: Colors.white,

                                          size: 35,
                                        ),
                                      ),

                                      const SizedBox(height: 16),

                                      /// TITLE
                                      const Text(
                                        "Logout Account",

                                        style: TextStyle(
                                          fontSize: 22,

                                          fontWeight: FontWeight.w800,

                                          color: AppColors.textDark,
                                        ),
                                      ),

                                      const SizedBox(height: 8),

                                      /// SUBTITLE
                                      Text(
                                        "Are you sure you want to logout from the app?",

                                        textAlign: TextAlign.center,

                                        style: TextStyle(
                                          fontSize: 14,

                                          color: Colors.grey.shade600,

                                          height: 1.5,
                                        ),
                                      ),

                                      const SizedBox(height: 24),

                                      /// BUTTONS
                                      Row(
                                        children: [
                                          /// CANCEL BUTTON
                                          Expanded(
                                            child: SizedBox(
                                              height: 50,

                                              child: OutlinedButton(
                                                style: OutlinedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          18,
                                                        ),
                                                  ),

                                                  side: BorderSide(
                                                    color: Colors.grey.shade300,
                                                  ),
                                                ),

                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },

                                                child: const Text(
                                                  "Cancel",

                                                  style: TextStyle(
                                                    fontSize: 15,

                                                    fontWeight: FontWeight.w700,

                                                    color: AppColors.textDark,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),

                                          const SizedBox(width: 12),

                                          /// LOGOUT BUTTON
                                          Expanded(
                                            child: Container(
                                              height: 50,

                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(18),

                                                gradient: LinearGradient(
                                                  colors: [
                                                    Colors.red.shade400,
                                                    Colors.red.shade600,
                                                  ],
                                                ),

                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 12,

                                                    color: Colors.red
                                                        .withOpacity(0.22),

                                                    offset: const Offset(0, 6),
                                                  ),
                                                ],
                                              ),

                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      Colors.transparent,

                                                  shadowColor:
                                                      Colors.transparent,

                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          18,
                                                        ),
                                                  ),
                                                ),

                                                onPressed: () {
                                                  /// CLEAR SESSION

                                                  //    StorageController.logout();

                                                  debugPrint("SESSION CLEARED");

                                                  /// GO LOGIN

                                                  // Get.offAll(
                                                  //       () => LoginScreen(),
                                                  // );
                                                },

                                                child: const Text(
                                                  "Logout",

                                                  style: TextStyle(
                                                    fontSize: 15,

                                                    fontWeight: FontWeight.w700,

                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
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

  /// ================= PREMIUM ICON =================
  Widget premiumIcon(IconData icon) {
    return Container(
      height: 42,
      width: 42,

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),

        borderRadius: BorderRadius.circular(15),

        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),

      child: Icon(icon, color: Colors.white, size: 22),
    );
  }

  /// ================= PREMIUM SECTION =================
  Widget premiumSection({required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),

        boxShadow: [
          BoxShadow(
            blurRadius: 16,
            spreadRadius: 1,
            color: Colors.black.withOpacity(0.035),
            offset: const Offset(0, 8),
          ),
        ],
      ),

      child: Column(children: children),
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
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: onTap,

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),

          color: const Color(0xFFF9FAFD),

          border: Border.all(color: Colors.grey.shade100),
        ),

        child: Row(
          children: [
            /// ICON
            Container(
              height: 45,
              width: 45,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),

                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [color, color.withOpacity(0.82)],
                ),

                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    spreadRadius: 1,
                    color: color.withOpacity(0.18),
                    offset: const Offset(0, 6),
                  ),
                ],
              ),

              child: Icon(icon, color: Colors.white, size: 22),
            ),

            const SizedBox(width: 14),

            /// TEXT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                      letterSpacing: 0.1,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    subTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,

                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.greyText,
                      height: 1.2,
                    ),
                  ),
                ],
              ),
            ),

            /// ARROW
            Container(
              height: 30,
              width: 30,

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),

              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ================= DIVIDER =================
  Widget divider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),

      child: Divider(height: 1, thickness: 1, color: Colors.grey.shade100),
    );
  }
}
