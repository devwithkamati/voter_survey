import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/appColors.dart';

class AddSurveyStaffScreen extends StatelessWidget {
  const AddSurveyStaffScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [
              /// HEADER
              // Container(
              //   padding: const EdgeInsets.all(20),
              //
              //   decoration: BoxDecoration(
              //     gradient: AppColors.primaryGradient,
              //     borderRadius: BorderRadius.circular(28),
              //   ),
              //
              //   child: const Row(
              //     children: [
              //       CircleAvatar(
              //         radius: 28,
              //         backgroundColor: Colors.white,
              //         child: Icon(
              //           Icons.person_add_alt_1_rounded,
              //           color: AppColors.saffron,
              //           size: 30,
              //         ),
              //       ),
              //
              //       SizedBox(width: 14),
              //
              //       Expanded(
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //
              //           children: [
              //             Text(
              //               "Add Survey Staff",
              //               style: TextStyle(
              //                 color: Colors.white,
              //                 fontSize: 22,
              //                 fontWeight: FontWeight.bold,
              //               ),
              //             ),
              //
              //             SizedBox(height: 4),
              //
              //             Text(
              //               "Create New Employee",
              //               style: TextStyle(color: Colors.white70),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              //
              // const SizedBox(height: 20),
              Row(
                children: [
                  /// 🔥 BACK BUTTON
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },

                    child: Container(
                      padding: const EdgeInsets.all(15),

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
                        "Add Survey Staff",

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
              SizedBox(height: 30),

              /// PERSONAL INFO
              sectionCard(
                title: "Personal Information",
                icon: Icons.person,
                child: Column(
                  children: [
                    customField(hint: "Full Name", icon: Icons.person),

                    customField(
                      hint: "Father Name",
                      icon: Icons.family_restroom,
                    ),

                    customField(hint: "Mobile Number", icon: Icons.phone),

                    customField(
                      hint: "Alternate Number",
                      icon: Icons.phone_android,
                    ),

                    customField(hint: "Email", icon: Icons.email),

                    customField(hint: "Password", icon: Icons.lock),
                  ],
                ),
              ),

              /// ADDRESS
              sectionCard(
                title: "Address Information",
                icon: Icons.location_on,
                child: Column(
                  children: [
                    customField(hint: "Address", icon: Icons.home, maxLines: 3),

                    customField(hint: "State", icon: Icons.map),

                    customField(hint: "District", icon: Icons.location_city),

                    customField(
                      hint: "Assigned Village",
                      icon: Icons.holiday_village,
                    ),
                  ],
                ),
              ),

              /// IDENTITY
              sectionCard(
                title: "Identity Information",
                icon: Icons.badge,
                child: Column(
                  children: [
                    customField(hint: "Identity Type", icon: Icons.credit_card),

                    customField(
                      hint: "Aadhaar Number",
                      icon: Icons.credit_card,
                    ),

                    customField(hint: "Voter ID", icon: Icons.how_to_vote),
                  ],
                ),
              ),

              /// DOCUMENTS
              sectionCard(
                title: "Upload Documents",
                icon: Icons.upload_file,
                child: Column(
                  children: [
                    uploadTile("User Image"),

                    uploadTile("Aadhaar Image"),

                    uploadTile("PAN Image"),

                    uploadTile("Voter ID Image"),

                    uploadTile("Driving License Image"),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              /// SAVE BUTTON
              SizedBox(
                width: double.infinity,
                height: 52,

                child: Container(
                  decoration: BoxDecoration(
                    gradient: AppColors.primaryGradient,
                    borderRadius: BorderRadius.circular(18),
                  ),

                  child: const Center(
                    child: Text(
                      "Save Staff",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget sectionCard({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),

                decoration: BoxDecoration(
                  color: AppColors.saffron.withOpacity(.12),
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Icon(icon, color: AppColors.saffron),
              ),

              const SizedBox(width: 12),

              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          child,
        ],
      ),
    );
  }

  Widget customField({
    required String hint,
    required IconData icon,
    int maxLines = 1,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),

      child: TextFormField(
        maxLines: maxLines,

        decoration: InputDecoration(
          hintText: hint,

          prefixIcon: Icon(icon, color: AppColors.saffron),

          filled: true,
          fillColor: AppColors.background,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: AppColors.saffron, width: 1.5),
          ),
        ),
      ),
    );
  }

  Widget uploadTile(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(18),
      ),

      child: Row(
        children: [
          const Icon(Icons.cloud_upload_rounded, color: AppColors.saffron),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.saffron,
              foregroundColor: Colors.white,
            ),
            child: const Text("Choose"),
          ),
        ],
      ),
    );
  }
}
