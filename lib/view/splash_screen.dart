// import 'package:flutter/material.dart';
//
// import '../utils/appColors.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//
//     // checkLoginStatus();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//
//         /// 🔥 Saffron Gradient Background
//         decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
//
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             /// 🔥 Logo Container
//             Container(
//               height: 230,
//               width: 230,
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: Colors.white.withOpacity(0.12),
//                 shape: BoxShape.circle,
//                 border: Border.all(
//                   color: Colors.white.withOpacity(0.25),
//                   width: 2,
//                 ),
//               ),
//               child: Image.asset(
//                 'assets/images/bjp_logo.webp',
//                 fit: BoxFit.contain,
//               ),
//             ),
//
//             const SizedBox(height: 45),
//
//             /// 🔥 Main Title
//             const Text(
//               "Anil Tripathi",
//               style: TextStyle(
//                 fontSize: 35,
//                 fontWeight: FontWeight.w800,
//                 letterSpacing: 1,
//                 color: AppColors.white,
//               ),
//             ),
//
//             const SizedBox(height: 10),
//
//             /// 🔥 Subtitle
//             const Text(
//               "Voter Survey Admin Panel",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.white70,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//
//             const SizedBox(height: 100),
//           ],
//         ),
//       ),
//     );
//   }
// }

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

        decoration: const BoxDecoration(gradient: AppColors.primaryGradient),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            /// 🔥 LOGO
            Container(
              height: 230,
              width: 230,

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.12),

                shape: BoxShape.circle,

                border: Border.all(
                  color: Colors.white.withOpacity(0.25),

                  width: 2,
                ),
              ),

              child: Image.asset(
                'assets/images/bjp_logo.webp',
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
                color: AppColors.white,
              ),
            ),

            const SizedBox(height: 10),

            /// 🔥 SUBTITLE
            const Text(
              "Voter Survey Admin Panel",

              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 100),

            const CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
