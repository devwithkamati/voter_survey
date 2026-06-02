// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:voter_survey_admin/view/home_page/totalsurvey_details_screen.dart';
//
// import '../../controller/total_survey_controller.dart';
// import '../../utils/appColors.dart';
//
// class TotalSurveyListScreen extends StatelessWidget {
//   const TotalSurveyListScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final TotalSurveyController controller = Get.find<TotalSurveyController>();
//
//     return Scaffold(
//       backgroundColor: AppColors.lightBackground,
//
//       body: SafeArea(
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 /// 🔥 BACK BUTTON
//                 GestureDetector(
//                   onTap: () {
//                     Get.back();
//                   },
//
//                   child: Container(
//                     padding: const EdgeInsets.all(15),
//
//                     decoration: BoxDecoration(
//                       color: AppColors.white,
//                       borderRadius: BorderRadius.circular(14),
//
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.03),
//                           blurRadius: 8,
//                         ),
//                       ],
//                     ),
//
//                     child: const Icon(
//                       Icons.arrow_back_ios_rounded,
//                       size: 20,
//                       color: AppColors.textDark,
//                     ),
//                   ),
//                 ),
//
//                 /// 🔥 CENTER TITLE
//                 Expanded(
//                   child: Center(
//                     child: const Text(
//                       "Total Survey List",
//
//                       style: TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.w700,
//                         color: AppColors.textDark,
//                       ),
//                     ),
//                   ),
//                 ),
//
//                 /// 🔥 RIGHT SIDE SPACE
//                 const SizedBox(width: 38),
//               ],
//             ),
//             const SizedBox(height: 10),
//
//             Expanded(
//               child: Obx(() {
//                 if (controller.isLoading.value) {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//
//                 return ListView.builder(
//                   padding: const EdgeInsets.all(16),
//
//                   itemCount: controller.surveyList.length,
//
//                   itemBuilder: (context, index) {
//                     final item = controller.surveyList[index];
//
//                     return Container(
//                       margin: const EdgeInsets.only(bottom: 7),
//
//                       padding: const EdgeInsets.all(14),
//
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//
//                         borderRadius: BorderRadius.circular(22),
//
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.03),
//
//                             blurRadius: 10,
//                           ),
//                         ],
//                       ),
//
//                       child: Row(
//                         children: [
//                           Column(
//                             children: [
//                               CircleAvatar(
//                                 radius: 38,
//
//                                 backgroundImage:
//                                     item.publicImage != null &&
//                                         item.publicImage!.isNotEmpty
//                                     ? NetworkImage(
//                                         "https://aniltripathi.in${item.publicImage}",
//                                       )
//                                     : null,
//
//                                 child: item.publicImage == null
//                                     ? const Icon(Icons.person)
//                                     : null,
//                               ),
//                               SizedBox(height: 20),
//                               GestureDetector(
//                                 onTap: () {
//                                   Get.to(
//                                     () =>
//                                         SurveyDetailsScreen(surveyId: item.id!),
//                                   );
//                                 },
//
//                                 child: Container(
//                                   padding: const EdgeInsets.symmetric(
//                                     horizontal: 12,
//                                     vertical: 8,
//                                   ),
//
//                                   decoration: BoxDecoration(
//                                     color: Colors.green.withOpacity(0.1),
//                                     borderRadius: BorderRadius.circular(12),
//                                   ),
//
//                                   child: const Text(
//                                     "View Details",
//                                     style: TextStyle(
//                                       color: Colors.green,
//                                       fontWeight: FontWeight.w700,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//
//                           /// IMAGE
//                           const SizedBox(width: 12),
//
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//
//                               children: [
//                                 detailTile("मतदाता का नाम", item.voterName),
//                                 detailTile("मोबाइल नंबर", item.mobileNo),
//                                 detailTile("गांव", item.village),
//                                 detailTile("बूथ संख्या", item.boothNo),
//                                 detailTile(
//                                   "आपने किसे वोट दिया",
//                                   item.ifTodayElectionHappenWhoseYouVote,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget detailTile(String title, String? value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 1),
//
//       child: Row(
//         children: [
//           Expanded(
//             flex: 4,
//             child: Text(
//               title,
//               style: const TextStyle(fontWeight: FontWeight.w600),
//             ),
//           ),
//
//           Expanded(flex: 5, child: Text(value ?? "N/A")),
//         ],
//       ),
//     );
//   }
// }
