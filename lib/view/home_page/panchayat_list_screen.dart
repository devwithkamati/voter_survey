import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voter_survey_admin/view/home_page/surveyby_village_screen.dart';

import '../../controller/panchayat_list_controller.dart';
import '../../utils/appColors.dart';

class PanchayatListScreen extends StatefulWidget {
  const PanchayatListScreen({super.key});

  @override
  State<PanchayatListScreen> createState() => _PanchayatListScreenState();
}

class _PanchayatListScreenState extends State<PanchayatListScreen> {
  final PanchayatController controller = Get.find<PanchayatController>();

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
      backgroundColor: AppColors.lightBackground,

      body: SafeArea(
        child: Column(
          children: [
            /// HEADER
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
                            "Panchayat List",

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

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {
                    searchText = value.toLowerCase();
                  });
                },
                decoration: InputDecoration(
                  hintText: "Search Panchayat / State",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
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

                final filteredList = controller.panchayatList.where((item) {
                  return (item.panchayatName ?? "").toLowerCase().contains(
                        searchText,
                      ) ||
                      (item.stateName ?? "").toLowerCase().contains(
                        searchText,
                      ) ||
                      (item.districtName ?? "").toLowerCase().contains(
                        searchText,
                      ) ||
                      (item.blockName ?? "").toLowerCase().contains(searchText);
                }).toList();

                if (filteredList.isEmpty) {
                  return const Center(
                    child: Text("No Matching Panchayat Found"),
                  );
                }

                return ListView.builder(
                  // padding: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    final item = filteredList[index];
                    //
                    // itemBuilder: (context, index) {
                    //   final item = controller.panchayatList[index];

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
                          /// ICON
                          Container(
                            height: 60,
                            width: 60,

                            decoration: BoxDecoration(
                              color: const Color(0xFF00ACC1).withOpacity(.1),

                              borderRadius: BorderRadius.circular(18),
                            ),

                            child: const Icon(
                              Icons.list_alt_rounded,
                              color: const Color(0xFF00ACC1),
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
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),

                                const SizedBox(height: 10),

                                detailTile("राज्य", item.stateName),

                                detailTile("जिला", item.districtName),

                                detailTile("विधानसभा", item.assemblyName),

                                detailTile("ब्लॉक", item.blockName),

                                const SizedBox(height: 2),
                                Align(
                                  alignment: Alignment.bottomRight,

                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        () => SurveyByVillageScreen(
                                          panchayatId: item.id ?? 0,
                                          panchayatName:
                                              item.panchayatName ?? "",
                                        ),
                                      );
                                    },

                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 14,
                                        vertical: 10,
                                      ),

                                      decoration: BoxDecoration(
                                        color: AppColors.saffron,
                                        borderRadius: BorderRadius.circular(12),
                                      ),

                                      child: const Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.visibility_rounded,
                                            color: Colors.white,
                                            size: 18,
                                          ),

                                          SizedBox(width: 6),
                                          Text(
                                            "View Survey",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
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
