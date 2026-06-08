import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/change_password_controller.dart';
import '../../utils/appColors.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final ChangePasswordController controller = Get.put(
    ChangePasswordController(),
  );

  bool oldPass = true;
  bool newPass = true;
  bool confirmPass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,

      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      //   title: const Text(
      //     "Change Password",
      //     style: TextStyle(
      //       color: AppColors.textDark,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   centerTitle: true,
      //   iconTheme: const IconThemeData(color: AppColors.textDark),
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const SizedBox(height: 40),

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
                              size: 25,
                              color: AppColors.textDark,
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        Center(
                          child: const Text(
                            "Change Password",

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
            const SizedBox(height: 40),

            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.saffron.withOpacity(.1),
              ),
              child: const Icon(
                Icons.lock_reset_rounded,
                size: 50,
                color: AppColors.saffron,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Update Password",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Text(
              "Keep your account secure by changing your password regularly.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade600),
            ),

            const SizedBox(height: 35),

            _buildField(
              controller: controller.oldPasswordController,
              hint: "Old Password",
              icon: Icons.lock_outline,
              obscure: oldPass,
              onToggle: () {
                setState(() {
                  oldPass = !oldPass;
                });
              },
            ),

            const SizedBox(height: 18),

            _buildField(
              controller: controller.newPasswordController,
              hint: "New Password",
              icon: Icons.lock_reset,
              obscure: newPass,
              onToggle: () {
                setState(() {
                  newPass = !newPass;
                });
              },
            ),

            const SizedBox(height: 18),

            _buildField(
              controller: controller.confirmPasswordController,
              hint: "Confirm Password",
              icon: Icons.verified_user_outlined,
              obscure: confirmPass,
              onToggle: () {
                setState(() {
                  confirmPass = !confirmPass;
                });
              },
            ),

            const SizedBox(height: 35),

            SizedBox(
              width: double.infinity,
              height: 56,

              child: Obx(() {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.saffron,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),

                  onPressed: controller.isLoading.value
                      ? null
                      : () {
                          controller.changePassword();
                        },

                  child: controller.isLoading.value
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          "Change Password",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    required bool obscure,
    required VoidCallback onToggle,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,

      decoration: InputDecoration(
        hintText: hint,

        prefixIcon: Icon(icon, color: AppColors.saffron),

        suffixIcon: IconButton(
          onPressed: onToggle,
          icon: Icon(
            obscure ? Icons.visibility_off : Icons.visibility,
            color: AppColors.saffron,
          ),
        ),

        filled: true,
        fillColor: Colors.white,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: AppColors.saffron, width: 2),
        ),
      ),
    );
  }
}
