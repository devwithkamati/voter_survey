import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/admin_profile_controller.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AdminProfileController>();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        final profile = controller.profile.value;

        if (profile == null) {
          return const Center(child: Text("No Profile Found"));
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              /// HEADER
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 60, bottom: 30),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF4F46E5), Color(0xFF7C3AED)],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => Get.back(),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.15),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white,
                                size: 22,
                              ),
                            ),
                          ),

                          //     const SizedBox(width: 15),

                          // const Text(
                          //   "Personal Information",
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 20,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    // CircleAvatar(
                    //   radius: 50,
                    //   backgroundColor: Colors.white,
                    //   child: Text(
                    //     profile.adminName.substring(0, 1).toUpperCase(),
                    //     style: const TextStyle(
                    //       fontSize: 36,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                    Container(
                      height: 110,
                      width: 110,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.15),
                            blurRadius: 20,
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          "assets/images/aniltri.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    Text(
                      profile.adminName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      profile.email,
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    buildPremiumCard(
                      icon: Icons.badge_outlined,
                      title: "Admin ID",
                      value: profile.adminId,
                      color: Colors.blue,
                    ),

                    buildPremiumCard(
                      icon: Icons.person_outline,
                      title: "Admin Name",
                      value: profile.adminName,
                      color: Colors.deepPurple,
                    ),

                    buildPremiumCard(
                      icon: Icons.phone_outlined,
                      title: "Mobile Number",
                      value: profile.mobile,
                      color: Colors.green,
                    ),

                    buildPremiumCard(
                      icon: Icons.email_outlined,
                      title: "Email Address",
                      value: profile.email,
                      color: Colors.orange,
                    ),

                    buildPremiumCard(
                      icon: Icons.lock_outline,
                      title: "Password",
                      value: profile.password,
                      color: Colors.red,
                    ),

                    const SizedBox(height: 20),
                    //
                    // Container(
                    //   width: double.infinity,
                    //   padding: const EdgeInsets.all(18),
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.circular(24),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.black.withOpacity(.05),
                    //         blurRadius: 20,
                    //       ),
                    //     ],
                    //   ),
                    //   child: const Column(
                    //     children: [
                    //       Icon(
                    //         Icons.admin_panel_settings,
                    //         size: 40,
                    //         color: AppColors.saffron,
                    //       ),
                    //
                    //       SizedBox(height: 10),
                    //
                    //       Text(
                    //         "Administrator Account",
                    //         style: TextStyle(
                    //           fontSize: 18,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //
                    //       SizedBox(height: 5),
                    //
                    //       Text(
                    //         "You have full access to manage survey, voting and employee modules.",
                    //         textAlign: TextAlign.center,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget buildPremiumCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(.08),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: color.withOpacity(.12),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(icon, color: color, size: 28),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                ),

                const SizedBox(height: 5),

                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
