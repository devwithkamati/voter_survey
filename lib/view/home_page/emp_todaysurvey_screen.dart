import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/emp_todaysurvey_controller.dart';

class EmpTodaySurveyScreen extends StatefulWidget {
  final int employeeId;

  const EmpTodaySurveyScreen({super.key, required this.employeeId});

  @override
  State<EmpTodaySurveyScreen> createState() => _EmpTodaySurveyScreenState();
}

class _EmpTodaySurveyScreenState extends State<EmpTodaySurveyScreen> {
  final EmpTodaySurveyController controller =
      Get.find<EmpTodaySurveyController>();

  @override
  void initState() {
    super.initState();

    controller.fetchTodaySurvey(widget.employeeId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),

      body: SafeArea(
        child: Column(
          children: [
            /// APP BAR
            Padding(
              padding: const EdgeInsets.all(16),

              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),

                    child: Container(
                      padding: const EdgeInsets.all(14),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.04),
                            blurRadius: 10,
                          ),
                        ],
                      ),

                      child: const Icon(Icons.arrow_back_ios_rounded, size: 20),
                    ),
                  ),

                  const Expanded(
                    child: Center(
                      child: Text(
                        "Today's Survey",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 48),
                ],
              ),
            ),

            /// LIST
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (controller.surveyList.isEmpty) {
                  return const Center(
                    child: Text("आज कोई सर्वे उपलब्ध नहीं है"),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),

                  itemCount: controller.surveyList.length,

                  itemBuilder: (context, index) {
                    final item = controller.surveyList[index];

                    return Container(
                      margin: const EdgeInsets.only(bottom: 8),

                      padding: const EdgeInsets.all(14),

                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.circular(20),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.04),
                            blurRadius: 10,
                          ),
                        ],
                      ),

                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          /// IMAGE
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),

                            child:
                                item.publicImage != null &&
                                    item.publicImage!.isNotEmpty
                                ? Image.network(
                                    "https://aniltripathi.in${item.publicImage}",
                                    width: 80,
                                    height: 80,
                                    fit: BoxFit.cover,

                                    errorBuilder: (_, __, ___) => Container(
                                      width: 80,
                                      height: 80,
                                      color: Colors.grey.shade200,
                                      child: const Icon(Icons.person),
                                    ),
                                  )
                                : Container(
                                    width: 80,
                                    height: 80,
                                    color: Colors.grey.shade200,
                                    child: const Icon(Icons.person),
                                  ),
                          ),

                          const SizedBox(width: 12),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                Text(
                                  item.voterName ?? "N/A",

                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),

                                const SizedBox(height: 8),

                                detailTile("मोबाइल नंबर", item.mobileNo),

                                detailTile("गांव", item.village),

                                detailTile("बूथ संख्या", item.boothNo),

                                detailTile(
                                  "वर्तमान पार्टी",
                                  item.currentElectionParty,
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
      padding: const EdgeInsets.symmetric(vertical: 3),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox(
            width: 90,

            child: Text(
              "$title :",
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
            ),
          ),

          Expanded(
            child: Text(
              value?.isNotEmpty == true ? value! : "N/A",

              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
