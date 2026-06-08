import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/booth_list_controller.dart';
import '../../utils/appColors.dart';

class BoothListScreen extends StatefulWidget {
  const BoothListScreen({super.key});

  @override
  State<BoothListScreen> createState() => _BoothListScreenState();
}

class _BoothListScreenState extends State<BoothListScreen> {
  final BoothController controller = Get.put(BoothController());

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
                            "Booth List",

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

            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  setState(() {
                    searchText = value.toLowerCase().trim();
                  });
                },
                decoration: InputDecoration(
                  hintText: "Search Booth / Panchayat / State",
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

            /// LIST
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                final filteredList = controller.boothList.where((item) {
                  return (item.boothName ?? "").toLowerCase().contains(
                        searchText,
                      ) ||
                      (item.panchayatName ?? "").toLowerCase().contains(
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
                  return const Center(child: Text("No Booth Found"));
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),

                  //    itemCount: controller.boothList.length,
                  itemCount: filteredList.length,

                  itemBuilder: (context, index) {
                    //     final item = controller.boothList[index];
                    final item = filteredList[index];

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
                              color: AppColors.success.withOpacity(.1),

                              borderRadius: BorderRadius.circular(18),
                            ),

                            child: const Icon(
                              Icons.apartment_rounded,
                              color: AppColors.success,
                              size: 30,
                            ),
                          ),

                          const SizedBox(width: 14),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(
                                  item.boothName ?? "N/A",

                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),

                                const SizedBox(height: 10),

                                detailTile("राज्य", item.stateName),

                                detailTile("जिला", item.districtName),

                                detailTile("विधानसभा", item.assemblyName),

                                detailTile("ब्लॉक", item.blockName),

                                detailTile("पंचायत", item.panchayatName),
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
