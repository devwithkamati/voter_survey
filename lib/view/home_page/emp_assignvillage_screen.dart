import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/emp_assignvillage_controller.dart';
import '../../utils/appColors.dart';

class EmpVillageScreen extends StatefulWidget {
  final int employeeId;

  const EmpVillageScreen({super.key, required this.employeeId});

  @override
  State<EmpVillageScreen> createState() => _EmpVillageScreenState();
}

class _EmpVillageScreenState extends State<EmpVillageScreen> {
  final AssignedVillageController controller =
      Get.find<AssignedVillageController>();
  // final VillageSurveyController villageSurveyController = Get.put(
  //   VillageSurveyController(),
  // );

  @override
  void initState() {
    super.initState();

    controller.fetchAssignedVillage(widget.employeeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      /// ================= APP BAR =================
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(90),
      //
      //   child: Container(
      //     decoration: BoxDecoration(
      //       gradient: const LinearGradient(
      //         begin: Alignment.topLeft,
      //         end: Alignment.bottomRight,
      //
      //         colors: [Color(0xFF6B63FF), Color(0xFF4B3CF0), Color(0xFF2D1FB3)],
      //       ),
      //
      //       borderRadius: const BorderRadius.only(
      //         bottomLeft: Radius.circular(30),
      //
      //         bottomRight: Radius.circular(30),
      //       ),
      //
      //       boxShadow: [
      //         BoxShadow(
      //           blurRadius: 22,
      //           spreadRadius: 1,
      //
      //           color: const Color(0xFF4B3CF0).withOpacity(0.20),
      //
      //           offset: const Offset(0, 10),
      //         ),
      //       ],
      //     ),
      //
      //     child: Stack(
      //       children: [
      //         /// GLOW
      //         Positioned(
      //           top: -40,
      //           right: -20,
      //
      //           child: Container(
      //             height: 140,
      //             width: 140,
      //
      //             decoration: BoxDecoration(
      //               shape: BoxShape.circle,
      //
      //               color: Colors.white.withOpacity(0.05),
      //             ),
      //           ),
      //         ),
      //
      //         Positioned(
      //           bottom: -50,
      //           left: -30,
      //
      //           child: Container(
      //             height: 160,
      //             width: 160,
      //
      //             decoration: BoxDecoration(
      //               shape: BoxShape.circle,
      //
      //               color: Colors.white.withOpacity(0.04),
      //             ),
      //           ),
      //         ),
      //
      //         SafeArea(
      //           child: Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: 18),
      //
      //             child: Row(
      //               children: [
      //                 /// BACK BUTTON
      //                 GestureDetector(
      //                   onTap: () {
      //                     Get.back();
      //                   },
      //
      //                   child: Container(
      //                     height: 44,
      //                     width: 44,
      //
      //                     decoration: BoxDecoration(
      //                       color: Colors.white.withOpacity(0.12),
      //
      //                       borderRadius: BorderRadius.circular(15),
      //
      //                       border: Border.all(
      //                         color: Colors.white.withOpacity(0.08),
      //                       ),
      //                     ),
      //
      //                     child: const Icon(
      //                       Icons.arrow_back_ios_new_rounded,
      //
      //                       color: Colors.white,
      //
      //                       size: 22,
      //                     ),
      //                   ),
      //                 ),
      //
      //                 /// TITLE
      //                 const Expanded(
      //                   child: Center(
      //                     child: Text(
      //                       "Assigned Villages",
      //
      //                       style: TextStyle(
      //                         color: Colors.white,
      //
      //                         fontSize: 24,
      //
      //                         fontWeight: FontWeight.w700,
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //
      //                 /// EMPTY SPACE
      //                 const SizedBox(width: 44),
      //               ],
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),

      /// ================= BODY =================
      // body: Obx(() {
      //   if (controller.isLoading.value) {
      //     return const Center(
      //       child: CircularProgressIndicator(color: AppColors.primary),
      //     );
      //   }
      //
      //   if (controller.villageList.isEmpty) {
      //     return const Center(
      //       child: Text(
      //         "No Village Assigned",
      //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //       ),
      //     );
      //   }
      //
      //   return Column(
      //     children: [
      //       /// LIST
      //       Expanded(
      //         child: ListView.builder(
      //           padding: const EdgeInsets.symmetric(horizontal: 16),
      //
      //           itemCount: controller.villageList.length,
      //
      //           itemBuilder: (context, index) {
      //             final village = controller.villageList[index];
      //
      //             return GestureDetector(
      //               onTap: () {
      //                 print("Village Id => ${village.id}");
      //               },
      //
      //               child: Container(
      //                 margin: const EdgeInsets.only(bottom: 12),
      //
      //                 padding: const EdgeInsets.all(16),
      //
      //                 decoration: BoxDecoration(
      //                   color: Colors.white,
      //                   borderRadius: BorderRadius.circular(20),
      //                   boxShadow: [
      //                     BoxShadow(
      //                       color: Colors.black.withOpacity(0.05),
      //                       blurRadius: 10,
      //                       offset: const Offset(0, 4),
      //                     ),
      //                   ],
      //                 ),
      //
      //                 child: Row(
      //                   children: [
      //                     Container(
      //                       height: 55,
      //                       width: 55,
      //                       decoration: BoxDecoration(
      //                         gradient: const LinearGradient(
      //                           colors: [Color(0xFF6B63FF), Color(0xFF4B3CF0)],
      //                         ),
      //                         borderRadius: BorderRadius.circular(15),
      //                       ),
      //                       child: const Icon(
      //                         Icons.location_city,
      //                         color: Colors.white,
      //                       ),
      //                     ),
      //
      //                     const SizedBox(width: 14),
      //
      //                     Expanded(
      //                       child: Column(
      //                         crossAxisAlignment: CrossAxisAlignment.start,
      //                         children: [
      //                           Text(
      //                             village.panchayatName ?? "",
      //                             style: const TextStyle(
      //                               fontSize: 17,
      //                               fontWeight: FontWeight.w700,
      //                             ),
      //                           ),
      //
      //                           const SizedBox(height: 6),
      //
      //                           Container(
      //                             padding: const EdgeInsets.symmetric(
      //                               horizontal: 8,
      //                               vertical: 4,
      //                             ),
      //                             decoration: BoxDecoration(
      //                               color: Colors.orange.shade100,
      //                               borderRadius: BorderRadius.circular(8),
      //                             ),
      //                             child: Text(
      //                               "Village ID : ${village.id}",
      //                               style: TextStyle(
      //                                 color: Colors.orange.shade800,
      //                                 fontSize: 11,
      //                                 fontWeight: FontWeight.w600,
      //                               ),
      //                             ),
      //                           ),
      //
      //                           const SizedBox(height: 6),
      //
      //                           Text(
      //                             "Block : ${village.blockName ?? ""}",
      //                             style: const TextStyle(
      //                               color: AppColors.primary,
      //                               fontWeight: FontWeight.w600,
      //                             ),
      //                           ),
      //                         ],
      //                       ),
      //                     ),
      //
      //                     Container(
      //                       height: 40,
      //                       width: 40,
      //                       decoration: BoxDecoration(
      //                         color: AppColors.primary.withOpacity(0.10),
      //                         borderRadius: BorderRadius.circular(10),
      //                       ),
      //                       child: const Icon(
      //                         Icons.arrow_forward_rounded,
      //                         color: AppColors.primary,
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             );
      //           },
      //         ),
      //       ),
      //     ],
      //   );
      // }),
      body: SafeArea(
        child: Column(
          children: [
            /// HEADER
            Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.03),
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

                const Expanded(
                  child: Center(
                    child: Text(
                      "Assigned Village",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textDark,
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 38),
              ],
            ),

            const SizedBox(height: 10),

            /// LIST
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (controller.villageList.isEmpty) {
                  return const Center(child: Text("No Village Found"));
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: controller.villageList.length,
                  itemBuilder: (context, index) {
                    final item = controller.villageList[index];

                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.03),
                            blurRadius: 10,
                          ),
                        ],
                      ),

                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// LEFT ICON
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(.1),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: const Icon(
                              Icons.location_city,
                              color: AppColors.primary,
                              size: 30,
                            ),
                          ),

                          const SizedBox(width: 14),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.panchayatName ?? "N/A",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),

                                const SizedBox(height: 10),

                                detailTile("Village ID", item.id?.toString()),

                                detailTile("Block", item.blockName),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget detailTile(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),

      child: Row(
        children: [
          SizedBox(
            width: 85,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),

          Expanded(child: Text(value ?? "N/A")),
        ],
      ),
    );
  }
}
