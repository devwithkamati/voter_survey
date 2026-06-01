// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../utils/appColors.dart';
// import 'dashbord_screen.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   bool isPasswordHidden = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.lightBackground,
//
//       body: Stack(
//         children: [
//           /// 🔹 BODY
//           SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//
//               children: [
//                 /// 🔹 TOP IMAGE
//                 Padding(
//                   padding: const EdgeInsets.only(top: 100, bottom: 50),
//
//                   child: SizedBox(
//                     height: MediaQuery.of(context).size.height * 0.22,
//                     width: double.infinity,
//
//                     child: Image.asset(
//                       'assets/images/bjp_logo.webp',
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                 ),
//
//                 /// 🔹 LOGIN CARD
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//
//                   child: Container(
//                     padding: const EdgeInsets.all(25),
//
//                     decoration: BoxDecoration(
//                       color: AppColors.white,
//
//                       borderRadius: BorderRadius.circular(28),
//
//                       boxShadow: [
//                         BoxShadow(
//                           color: AppColors.saffron.withOpacity(0.08),
//                           blurRadius: 20,
//                           offset: const Offset(0, 10),
//                         ),
//                       ],
//                     ),
//
//                     child: Column(
//                       children: [
//                         /// TITLE
//                         const Text(
//                           "Anil Tripathi",
//
//                           style: TextStyle(
//                             fontSize: 32,
//                             fontWeight: FontWeight.bold,
//                             color: AppColors.saffron,
//                           ),
//                         ),
//
//                         const SizedBox(height: 8),
//
//                         /// SUBTITLE
//                         const Text(
//                           "Admin Panel Login",
//
//                           style: TextStyle(color: Colors.grey, fontSize: 16),
//                         ),
//
//                         const SizedBox(height: 30),
//
//                         /// MOBILE FIELD
//                         buildTextField(
//                           hint: "Enter mobile number",
//                           icon: Icons.phone,
//                           keyboard: TextInputType.phone,
//                         ),
//
//                         /// PASSWORD FIELD
//                         /// PASSWORD FIELD
//                         buildTextField(
//                           hint: "Enter password",
//                           icon: Icons.lock,
//
//                           isPassword: isPasswordHidden,
//
//                           suffixIcon: IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 isPasswordHidden = !isPasswordHidden;
//                               });
//                             },
//
//                             icon: Icon(
//                               isPasswordHidden
//                                   ? Icons.visibility_off
//                                   : Icons.visibility,
//
//                               color: AppColors.saffron,
//                             ),
//                           ),
//                         ),
//
//                         const SizedBox(height: 10),
//
//                         /// FORGOT PASSWORD
//                         Align(
//                           alignment: Alignment.centerRight,
//
//                           child: GestureDetector(
//                             onTap: () {},
//
//                             child: const Text(
//                               "पासवर्ड भूल गए?",
//
//                               style: TextStyle(
//                                 color: AppColors.saffron,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                           ),
//                         ),
//
//                         const SizedBox(height: 25),
//
//                         /// LOGIN BUTTON
//                         SizedBox(
//                           width: double.infinity,
//                           height: 52,
//
//                           child: ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: AppColors.saffron,
//
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(18),
//                               ),
//                             ),
//
//                             onPressed: () {
//                               Get.to(() => const DashBoardScreen());
//                             },
//
//                             child: const Text(
//                               "लॉगिन करें",
//
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: AppColors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(height: 25),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget buildTextField({
//     required String hint,
//     required IconData icon,
//
//     TextInputType? keyboard,
//     bool isPassword = false,
//
//     Widget? suffixIcon,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 18),
//
//       child: TextField(
//         keyboardType: keyboard,
//         obscureText: isPassword,
//
//         decoration: InputDecoration(
//           hintText: hint,
//
//           prefixIcon: Icon(icon, color: AppColors.saffron),
//
//           suffixIcon: suffixIcon,
//
//           filled: true,
//           fillColor: AppColors.lightBackground,
//
//           contentPadding: const EdgeInsets.symmetric(
//             horizontal: 16,
//             vertical: 14,
//           ),
//
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(18),
//
//             borderSide: BorderSide(color: Colors.grey.shade300),
//           ),
//
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(18),
//
//             borderSide: const BorderSide(color: AppColors.saffron, width: 2),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';
import '../utils/appColors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController controller = Get.put(LoginController());

  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// 🔶 TOP LOGO
              Padding(
                padding: const EdgeInsets.only(top: 70, bottom: 40),

                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.22,

                  width: double.infinity,

                  child: Image.asset(
                    'assets/images/bjp_logo.webp',
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              /// 🔶 LOGIN CARD
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),

                child: Container(
                  padding: const EdgeInsets.all(25),

                  decoration: BoxDecoration(
                    color: AppColors.white,

                    borderRadius: BorderRadius.circular(28),

                    boxShadow: [
                      BoxShadow(
                        color: AppColors.saffron.withOpacity(0.08),

                        blurRadius: 20,

                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),

                  child: Column(
                    children: [
                      /// 🔶 TITLE
                      const Text(
                        "Anil Tripathi",

                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: AppColors.saffron,
                        ),
                      ),

                      const SizedBox(height: 8),

                      /// 🔶 SUBTITLE
                      const Text(
                        "Admin Panel Login",

                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),

                      const SizedBox(height: 30),

                      /// 🔶 MOBILE FIELD
                      buildTextField(
                        controller: controller.mobileController,

                        hint: "मोबाइल नंबर दर्ज करें",

                        icon: Icons.phone,

                        keyboard: TextInputType.phone,
                      ),

                      /// 🔶 PASSWORD FIELD
                      buildTextField(
                        controller: controller.passwordController,

                        hint: "पासवर्ड दर्ज करें",

                        icon: Icons.lock,

                        keyboard: TextInputType.visiblePassword,

                        isPassword: isPasswordHidden,

                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isPasswordHidden = !isPasswordHidden;
                            });
                          },

                          icon: Icon(
                            isPasswordHidden
                                ? Icons.visibility_off
                                : Icons.visibility,

                            color: AppColors.saffron,
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      /// 🔶 FORGOT PASSWORD
                      Align(
                        alignment: Alignment.centerRight,

                        child: GestureDetector(
                          onTap: () {},

                          child: const Text(
                            "पासवर्ड भूल गए?",

                            style: TextStyle(
                              color: AppColors.saffron,

                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      /// 🔶 LOGIN BUTTON
                      SizedBox(
                        width: double.infinity,
                        height: 55,

                        child: Obx(() {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.saffron,

                              elevation: 0,

                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),

                            onPressed: controller.isLoading.value
                                ? null
                                : () {
                                    controller.loginApi();
                                  },

                            child: controller.isLoading.value
                                ? const SizedBox(
                                    height: 22,
                                    width: 22,

                                    child: CircularProgressIndicator(
                                      color: Colors.white,

                                      strokeWidth: 2.5,
                                    ),
                                  )
                                : const Text(
                                    "लॉगिन करें",

                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,

                                      color: AppColors.white,
                                    ),
                                  ),
                          );
                        }),
                      ),
                    ],
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

  /// 🔶 CUSTOM TEXTFIELD
  Widget buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,

    TextInputType? keyboard,
    bool isPassword = false,

    Widget? suffixIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),

      child: TextField(
        controller: controller,

        keyboardType: keyboard,

        obscureText: isPassword,

        decoration: InputDecoration(
          hintText: hint,

          prefixIcon: Icon(icon, color: AppColors.saffron),

          suffixIcon: suffixIcon,

          filled: true,

          fillColor: AppColors.lightBackground,

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
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
      ),
    );
  }
}
