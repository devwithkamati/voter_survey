import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/booth_list_controller.dart';
import '../../utils/appColors.dart';

class BoothListScreen extends StatelessWidget {
  BoothListScreen({super.key});

  final BoothController controller = Get.put(BoothController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,

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
                      "Booth List",
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

                if (controller.boothList.isEmpty) {
                  return const Center(child: Text("No Booth Found"));
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),

                  itemCount: controller.boothList.length,

                  itemBuilder: (context, index) {
                    final item = controller.boothList[index];

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
                              color: AppColors.secondary.withOpacity(.1),

                              borderRadius: BorderRadius.circular(18),
                            ),

                            child: const Icon(
                              Icons.apartment_rounded,
                              color: AppColors.secondary,
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
