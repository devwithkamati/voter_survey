import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voter_survey_admin/view/home_page/emp_action_screen.dart';
import 'package:voter_survey_admin/view/home_page/surveyEmp_details_screen.dart';

import '../../controller/survey_employee_controller.dart';
import '../../utils/appColors.dart';

class SurveyEmployeeScreen extends StatefulWidget {
  SurveyEmployeeScreen({super.key});

  @override
  State<SurveyEmployeeScreen> createState() => _SurveyEmployeeScreenState();
}

class _SurveyEmployeeScreenState extends State<SurveyEmployeeScreen> {
  final SurveyEmployeeController controller = Get.put(
    SurveyEmployeeController(),
  );
  final TextEditingController searchController = TextEditingController();
  String searchText = "";
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      body: SafeArea(
        child: Column(
          children: [
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

                SizedBox(width: 30),

                /// 🔥 CENTER TITLE
                Text(
                  "Survey Employee",

                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textDark,
                  ),
                ),

                /// 🔥 RIGHT SIDE SPACE
                const SizedBox(width: 38),
              ],
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {
                    searchText = value.toLowerCase().trim();
                  });
                },
                decoration: InputDecoration(
                  hintText: "Search Name / Mobile / ID",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: searchText.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            searchController.clear();
                            setState(() {
                              searchText = "";
                            });
                          },
                        )
                      : null,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            /// LIST
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }
                final employeeList = controller.filteredList.where((item) {
                  return (item.fullName ?? "").toLowerCase().contains(
                        searchText,
                      ) ||
                      (item.mobileNumber ?? "").toLowerCase().contains(
                        searchText,
                      ) ||
                      (item.id?.toString() ?? "").contains(searchText);
                }).toList();
                if (employeeList.isEmpty) {
                  return const Center(
                    child: Text(
                      "No Employee Found",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),

                  //itemCount: controller.filteredList.length,
                  itemCount: employeeList.length,

                  itemBuilder: (context, index) {
                    //final item = controller.filteredList[index];
                    final item = employeeList[index];
                    return Container(
                      margin: const EdgeInsets.only(bottom: 7),

                      padding: const EdgeInsets.all(14),

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
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 32,

                                backgroundImage: NetworkImage(
                                  "https://www.aniltripathi.in${item.userImage}",
                                ),
                              ),
                              SizedBox(height: 7),
                            ],
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          detailTile("नाम :", item.fullName),

                                          const SizedBox(height: 2),

                                          detailTile(
                                            "आईडी :",
                                            item.id?.toString(),
                                          ),

                                          const SizedBox(height: 2),

                                          detailTile(
                                            "मोबाइल :",
                                            item.mobileNumber ?? "N/A",
                                          ),
                                        ],
                                      ),
                                    ),

                                    Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xffF4F6FA),
                                        borderRadius: BorderRadius.circular(14),
                                      ),
                                      child: PopupMenuButton<String>(
                                        padding: EdgeInsets.zero,
                                        elevation: 10,
                                        offset: const Offset(0, 45),
                                        color: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            18,
                                          ),
                                        ),
                                        icon: const Padding(
                                          padding: EdgeInsets.all(8),
                                          child: Icon(
                                            Icons.more_vert_rounded,
                                            size: 24,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        onSelected: (value) {
                                          if (value == "details") {
                                            Get.to(
                                              () => SurveyEmployeeDetailsScreen(
                                                employeeId: item.id!,
                                              ),
                                            );
                                          }

                                          if (value == "action") {
                                            Get.to(
                                              () => EmpActionScreen(
                                                employeeId: item.id ?? 0,
                                              ),
                                            );
                                          }
                                        },
                                        itemBuilder: (context) => [
                                          PopupMenuItem(
                                            value: "details",
                                            child: Row(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.all(
                                                    8,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.green.shade50,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                  ),
                                                  child: const Icon(
                                                    Icons.visibility_outlined,
                                                    color: Colors.green,
                                                    size: 18,
                                                  ),
                                                ),
                                                const SizedBox(width: 12),
                                                const Text(
                                                  "View Details",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          PopupMenuItem(
                                            value: "action",
                                            child: Row(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.all(
                                                    8,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        Colors.orange.shade50,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                  ),
                                                  child: const Icon(
                                                    Icons
                                                        .admin_panel_settings_outlined,
                                                    color: Colors.orange,
                                                    size: 18,
                                                  ),
                                                ),
                                                const SizedBox(width: 12),
                                                const Text(
                                                  "Action",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                // Row(
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [
                                //     Expanded(
                                //       child: detailTile("नाम :", item.fullName),
                                //     ),
                                //
                                //     Container(
                                //       decoration: BoxDecoration(
                                //         color: Colors.grey.shade100,
                                //         borderRadius: BorderRadius.circular(12),
                                //       ),
                                //       child: PopupMenuButton<String>(
                                //         elevation: 8,
                                //         offset: const Offset(0, 45),
                                //         shape: RoundedRectangleBorder(
                                //           borderRadius: BorderRadius.circular(
                                //             16,
                                //           ),
                                //         ),
                                //         icon: const Icon(
                                //           Icons.more_horiz_rounded,
                                //           color: Colors.black87,
                                //         ),
                                //         onSelected: (value) {
                                //           if (value == "details") {
                                //             Get.to(
                                //               () => SurveyEmployeeDetailsScreen(
                                //                 employeeId: item.id!,
                                //               ),
                                //             );
                                //           }
                                //
                                //           if (value == "action") {
                                //             Get.to(
                                //               () => EmpActionScreen(
                                //                 employeeId: item.id ?? 0,
                                //               ),
                                //             );
                                //           }
                                //         },
                                //         itemBuilder: (context) => [
                                //           PopupMenuItem(
                                //             value: "details",
                                //             child: Row(
                                //               children: [
                                //                 Container(
                                //                   padding: const EdgeInsets.all(
                                //                     8,
                                //                   ),
                                //                   decoration: BoxDecoration(
                                //                     color: Colors.green
                                //                         .withOpacity(.12),
                                //                     borderRadius:
                                //                         BorderRadius.circular(
                                //                           10,
                                //                         ),
                                //                   ),
                                //                   child: const Icon(
                                //                     Icons.visibility_outlined,
                                //                     color: Colors.green,
                                //                     size: 18,
                                //                   ),
                                //                 ),
                                //                 const SizedBox(width: 12),
                                //                 const Text(
                                //                   "View Details",
                                //                   style: TextStyle(
                                //                     fontWeight: FontWeight.w600,
                                //                   ),
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //
                                //           PopupMenuItem(
                                //             value: "action",
                                //             child: Row(
                                //               children: [
                                //                 Container(
                                //                   padding: const EdgeInsets.all(
                                //                     8,
                                //                   ),
                                //                   decoration: BoxDecoration(
                                //                     color: AppColors.saffron
                                //                         .withOpacity(.12),
                                //                     borderRadius:
                                //                         BorderRadius.circular(
                                //                           10,
                                //                         ),
                                //                   ),
                                //                   child: const Icon(
                                //                     Icons
                                //                         .admin_panel_settings_outlined,
                                //                     color: AppColors.saffron,
                                //                     size: 18,
                                //                   ),
                                //                 ),
                                //                 const SizedBox(width: 12),
                                //                 const Text(
                                //                   "Action",
                                //                   style: TextStyle(
                                //                     fontWeight: FontWeight.w600,
                                //                   ),
                                //                 ),
                                //               ],
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //
                            //   children: [
                            //     detailTile("नाम :", item.fullName),
                            //
                            //     detailTile("आईडी :", item.id?.toString()),
                            //
                            //     detailTile(
                            //       "मोबाइल नंबर :",
                            //       item.mobileNumber ?? "N/A",
                            //     ),
                            //
                            //     PopupMenuButton<String>(
                            //       icon: const Icon(
                            //         Icons.more_vert,
                            //         color: Colors.black54,
                            //       ),
                            //       shape: RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(12),
                            //       ),
                            //       onSelected: (value) {
                            //         if (value == "details") {
                            //           Get.to(
                            //             () => SurveyEmployeeDetailsScreen(
                            //               employeeId: item.id!,
                            //             ),
                            //           );
                            //         } else if (value == "action") {
                            //           Get.to(
                            //             () => EmpActionScreen(
                            //               employeeId: item.id ?? 0,
                            //             ),
                            //           );
                            //         }
                            //       },
                            //       itemBuilder: (context) => [
                            //         const PopupMenuItem(
                            //           value: "details",
                            //           child: Row(
                            //             children: [
                            //               Icon(
                            //                 Icons.visibility_outlined,
                            //                 color: Colors.green,
                            //               ),
                            //               SizedBox(width: 10),
                            //               Text("View Details"),
                            //             ],
                            //           ),
                            //         ),
                            //         const PopupMenuItem(
                            //           value: "action",
                            //           child: Row(
                            //             children: [
                            //               Icon(
                            //                 Icons.settings_outlined,
                            //                 color: Colors.orange,
                            //               ),
                            //               SizedBox(width: 10),
                            //               Text("Action"),
                            //             ],
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //
                            //     // Row(
                            //     //   children: [
                            //     //     GestureDetector(
                            //     //       onTap: () {
                            //     //         Get.to(
                            //     //           () => SurveyEmployeeDetailsScreen(
                            //     //             employeeId: item.id!,
                            //     //           ),
                            //     //         );
                            //     //       },
                            //     //
                            //     //       child: Container(
                            //     //         padding: const EdgeInsets.symmetric(
                            //     //           horizontal: 12,
                            //     //           vertical: 8,
                            //     //         ),
                            //     //
                            //     //         decoration: BoxDecoration(
                            //     //           color: Colors.green.withOpacity(0.1),
                            //     //           borderRadius: BorderRadius.circular(
                            //     //             12,
                            //     //           ),
                            //     //         ),
                            //     //
                            //     //         child: const Text(
                            //     //           "View Details",
                            //     //           style: TextStyle(
                            //     //             color: Colors.green,
                            //     //             fontWeight: FontWeight.w700,
                            //     //           ),
                            //     //         ),
                            //     //       ),
                            //     //     ),
                            //     //     SizedBox(width: 15),
                            //     //     GestureDetector(
                            //     //       // onTap: () {
                            //     //       //   Get.to(() => EmpActionScreen());
                            //     //       // },
                            //     //       onTap: () {
                            //     //         Get.to(
                            //     //           () => EmpActionScreen(
                            //     //             employeeId: item.id ?? 0,
                            //     //           ),
                            //     //         );
                            //     //       },
                            //     //       child: Container(
                            //     //         padding: const EdgeInsets.symmetric(
                            //     //           horizontal: 12,
                            //     //           vertical: 8,
                            //     //         ),
                            //     //
                            //     //         decoration: BoxDecoration(
                            //     //           color: AppColors.saffron.withOpacity(
                            //     //             0.8,
                            //     //           ),
                            //     //           borderRadius: BorderRadius.circular(
                            //     //             12,
                            //     //           ),
                            //     //         ),
                            //     //
                            //     //         child: const Text(
                            //     //           "Action",
                            //     //           style: TextStyle(
                            //     //             color: Colors.white,
                            //     //             fontWeight: FontWeight.w700,
                            //     //           ),
                            //     //         ),
                            //     //       ),
                            //     //     ),
                            //     //   ],
                            //     // ),
                            //
                            //     // detailTile(
                            //     //   "पूर्ण किए गए गांव",
                            //     //   item.completedVillageName ?? "N/A",
                            //     // ),
                            //     //
                            //     // detailTile(
                            //     //   "लंबित गांव",
                            //     //   item.pendingVillageName ?? "N/A",
                            //     // ),
                            //   ],
                            // ),
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
      padding: const EdgeInsets.symmetric(vertical: 3),

      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),

          Expanded(flex: 5, child: Text(value ?? "N/A")),
        ],
      ),
    );
  }
}
