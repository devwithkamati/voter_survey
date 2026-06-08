import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';
import '../utils/appColors.dart';
import 'dashbord_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    checkLoginStatus();
  }

  /// 🔥 CHECK LOGIN SESSION
  void checkLoginStatus() {
    Timer(const Duration(seconds: 3), () {
      bool isLogin = StorageService.getLogin();

      if (isLogin) {
        /// 🔥 DASHBOARD
        Get.offAll(() => const DashBoardScreen());
      } else {
        /// 🔥 LOGIN SCREEN
        Get.offAll(() => const LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,

        decoration: const BoxDecoration(color: Colors.white),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            /// 🔥 LOGO
            Container(
              height: 320,
              width: 320,

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.12),

                shape: BoxShape.circle,

                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.25),

                  width: 2,
                ),
              ),

              child: Image.asset(
                'assets/images/banner2.jpeg',
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 45),

            /// 🔥 TITLE
            const Text(
              "Anil Tripathi",

              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w800,
                letterSpacing: 1,
                color: AppColors.saffron,
              ),
            ),

            const SizedBox(height: 10),

            /// 🔥 SUBTITLE
            const Text(
              "Voter Survey Admin Panel",

              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 100),

            const CircularProgressIndicator(color: AppColors.saffron),
          ],
        ),
      ),
    );
  }
}
