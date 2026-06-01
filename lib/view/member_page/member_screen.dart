import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/member_controller.dart';
import '../../model/member_model.dart';
import '../../utils/appColors.dart';
import '../dashbord_screen.dart';

class MemberScreen extends StatefulWidget {
  const MemberScreen({super.key});

  @override
  State<MemberScreen> createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  final MemberController controller = Get.put(MemberController());

  final TextEditingController searchController = TextEditingController();

  List<MemberData> filteredList = [];

  @override
  void initState() {
    super.initState();

    ever(controller.memberList, (callback) {
      filteredList = controller.memberList.toList();
      setState(() {});
    });
  }

  /// ================= SEARCH =================
  void searchMember(String value) {
    if (value.isEmpty) {
      filteredList = controller.memberList.toList();
    } else {
      filteredList = controller.memberList.where((member) {
        final name = member.fullName?.toLowerCase() ?? '';

        final phone = member.mobileNumber?.toLowerCase() ?? '';

        return name.contains(value.toLowerCase()) ||
            phone.contains(value.toLowerCase());
      }).toList();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,

      floatingActionButton: Container(
        height: 62,
        width: 62,

        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          shape: BoxShape.circle,

          boxShadow: [
            BoxShadow(
              color: AppColors.saffron.withOpacity(0.35),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
        ),

        child: FloatingActionButton(
          onPressed: () {},

          elevation: 0,
          backgroundColor: Colors.transparent,

          child: const Icon(Icons.add_rounded, size: 34, color: Colors.white),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [
              Row(
                children: [
                  /// 🔥 BACK BUTTON
                  GestureDetector(
                    onTap: () {
                      Get.offAll(() => DashBoardScreen());
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
                        size: 20,
                        color: AppColors.textDark,
                      ),
                    ),
                  ),

                  /// 🔥 CENTER TITLE
                  Expanded(
                    child: Center(
                      child: const Text(
                        "Members",

                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textDark,
                        ),
                      ),
                    ),
                  ),

                  /// 🔥 RIGHT SIDE SPACE
                  const SizedBox(width: 38),
                ],
              ),

              SizedBox(height: 20),

              /// ================= SEARCH BAR =================
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 54,

                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(18),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 8,
                          ),
                        ],
                      ),

                      child: TextField(
                        controller: searchController,

                        onChanged: searchMember,

                        decoration: InputDecoration(
                          hintText: "सदस्य खोजे...",

                          hintStyle: const TextStyle(
                            color: AppColors.textLight,
                            fontSize: 14,
                          ),

                          prefixIcon: const Icon(
                            Icons.search_rounded,
                            color: AppColors.greyText,
                          ),

                          border: InputBorder.none,

                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Container(
                    height: 54,
                    width: 54,

                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(18),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 8,
                        ),
                      ],
                    ),

                    child: const Icon(
                      Icons.filter_alt_outlined,
                      color: AppColors.textDark,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              /// ================= MEMBER LIST =================
              Expanded(
                child: Obx(() {
                  /// LOADING
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  /// EMPTY
                  if (filteredList.isEmpty) {
                    return const Center(child: Text("No Members Found"));
                  }

                  return RefreshIndicator(
                    onRefresh: controller.refreshApi,

                    child: ListView.builder(
                      itemCount: filteredList.length,

                      itemBuilder: (context, index) {
                        final item = filteredList[index];

                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),

                          padding: const EdgeInsets.all(14),

                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(22),

                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.03),
                                blurRadius: 10,
                              ),
                            ],
                          ),

                          child: Row(
                            children: [
                              /// PROFILE IMAGE
                              Container(
                                height: 64,
                                width: 64,

                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,

                                  border: Border.all(
                                    color: AppColors.border,
                                    width: 1.2,
                                  ),
                                ),

                                child: Padding(
                                  padding: const EdgeInsets.all(3),

                                  child: ClipOval(
                                    child: Image.network(
                                      "https://aniltripathi.in${item.photo}",

                                      fit: BoxFit.cover,

                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            return Container(
                                              color: Colors.grey.shade200,

                                              child: const Icon(
                                                Icons.person,
                                                size: 35,
                                                color: Colors.grey,
                                              ),
                                            );
                                          },
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(width: 14),

                              /// MEMBER DETAILS
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Text(
                                      item.fullName ?? "",

                                      maxLines: 1,

                                      overflow: TextOverflow.ellipsis,

                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.textDark,
                                      ),
                                    ),

                                    const SizedBox(height: 3),

                                    Text(
                                      item.mobileNumber ?? "",

                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.textDark,
                                      ),
                                    ),

                                    const SizedBox(height: 3),

                                    Text(
                                      item.villageWard ?? "",

                                      maxLines: 1,

                                      overflow: TextOverflow.ellipsis,

                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: AppColors.greyText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(width: 10),

                              /// GENDER
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 8,
                                ),

                                decoration: BoxDecoration(
                                  color: Colors.green.withOpacity(0.12),

                                  borderRadius: BorderRadius.circular(12),
                                ),

                                child: Text(
                                  item.gender ?? "",

                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
