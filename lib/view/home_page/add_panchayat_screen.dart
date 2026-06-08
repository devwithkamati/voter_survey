import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/add_panchayat_controller.dart';
import '../../controller/assembly_controller.dart';
import '../../controller/block_controller.dart';
import '../../controller/district_controller.dart';
import '../../controller/state_controller.dart';
import '../../utils/appColors.dart';

class AddPanchayatScreen extends StatefulWidget {
  const AddPanchayatScreen({super.key});

  @override
  State<AddPanchayatScreen> createState() => _AddPanchayatScreenState();
}

class _AddPanchayatScreenState extends State<AddPanchayatScreen> {
  final StateController stateController = Get.put(StateController());
  final DistrictController districtController = Get.put(DistrictController());
  final AssemblyController assemblyController = Get.put(AssemblyController());
  final BlockController blockController = Get.put(BlockController());
  final AddPanchayatController panchayatController = Get.put(
    AddPanchayatController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            SizedBox(height: 30),

            /// 🔥 TOP BAR
            Builder(
              builder: (context) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 8),
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
                              size: 26,
                              color: AppColors.textDark,
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        Center(
                          child: const Text(
                            "Add Panchayat",

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

            const SizedBox(height: 22),
            Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 650),
                width: MediaQuery.of(context).size.width * .95,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.05),
                      blurRadius: 20,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Header
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.account_balance,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          "Add Panchayat",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),

                    /// State
                    Obx(
                      () => DropdownButtonFormField<int>(
                        value: stateController.selectedStateId.value,

                        isExpanded: true,

                        decoration: InputDecoration(
                          hintText: "Select State",

                          prefixIcon: const Icon(
                            Icons.location_on_outlined,
                            color: AppColors.primary,
                          ),

                          filled: true,
                          fillColor: Colors.white,

                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 18,
                          ),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: AppColors.primary,
                              width: 1.5,
                            ),
                          ),
                        ),

                        items: stateController.stateList.map((state) {
                          return DropdownMenuItem<int>(
                            value: state.id,
                            child: Text(state.stateName),
                          );
                        }).toList(),
                        onChanged: (value) {
                          stateController.selectedStateId.value = value;

                          districtController.selectedDistrictId.value = null;

                          assemblyController.selectedAssemblyId.value = null;

                          districtController.districtList.clear();
                          assemblyController.assemblyList.clear();

                          if (value != null) {
                            districtController.getDistricts(value);
                          }
                        },
                      ),
                    ),

                    const SizedBox(height: 12),

                    Obx(
                      () => DropdownButtonFormField<int>(
                        value:
                            districtController.districtList.any(
                              (e) =>
                                  e.id ==
                                  districtController.selectedDistrictId.value,
                            )
                            ? districtController.selectedDistrictId.value
                            : null,
                        isExpanded: true,

                        decoration: InputDecoration(
                          hintText: "Select State",

                          prefixIcon: const Icon(
                            Icons.location_on_outlined,
                            color: AppColors.primary,
                          ),

                          filled: true,
                          fillColor: Colors.white,

                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 18,
                          ),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: AppColors.primary,
                              width: 1.5,
                            ),
                          ),
                        ),
                        items: districtController.districtList.map((district) {
                          return DropdownMenuItem<int>(
                            value: district.id,
                            child: Text(district.districtName),
                          );
                        }).toList(),

                        onChanged: (value) {
                          districtController.selectedDistrictId.value = value;

                          assemblyController.selectedAssemblyId.value = null;

                          assemblyController.assemblyList.clear();

                          if (value != null) {
                            assemblyController.getAssemblies(value);
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 12),
                    Obx(
                      () => DropdownButtonFormField<int>(
                        value:
                            assemblyController.assemblyList.any(
                              (e) =>
                                  e.id ==
                                  assemblyController.selectedAssemblyId.value,
                            )
                            ? assemblyController.selectedAssemblyId.value
                            : null,
                        isExpanded: true,

                        decoration: InputDecoration(
                          hintText: "Select Assembly",

                          prefixIcon: const Icon(
                            Icons.how_to_vote_outlined,
                            color: AppColors.primary,
                          ),

                          filled: true,
                          fillColor: Colors.white,

                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 18,
                          ),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: AppColors.primary,
                              width: 1.5,
                            ),
                          ),
                        ),

                        items: assemblyController.assemblyList.map((assembly) {
                          return DropdownMenuItem<int>(
                            value: assembly.id,
                            child: Text(assembly.assemblyName),
                          );
                        }).toList(),

                        onChanged: (value) {
                          assemblyController.selectedAssemblyId.value = value;

                          blockController.selectedBlockId.value = null;

                          blockController.blockList.clear();

                          if (value != null) {
                            blockController.getBlocks(value);
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 12),
                    Obx(
                      () => DropdownButtonFormField<int>(
                        value:
                            blockController.blockList.any(
                              (e) =>
                                  e.id == blockController.selectedBlockId.value,
                            )
                            ? blockController.selectedBlockId.value
                            : null,

                        isExpanded: true,

                        decoration: InputDecoration(
                          hintText: "Select Block",

                          prefixIcon: const Icon(
                            Icons.account_tree_outlined,
                            color: AppColors.primary,
                          ),

                          filled: true,
                          fillColor: Colors.white,

                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 18,
                          ),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: AppColors.primary,
                              width: 1.5,
                            ),
                          ),
                        ),

                        items: blockController.blockList.map((block) {
                          return DropdownMenuItem<int>(
                            value: block.id,
                            child: Text(block.blockName),
                          );
                        }).toList(),

                        onChanged: (value) {
                          blockController.selectedBlockId.value = value;
                        },
                      ),
                    ),

                    const SizedBox(height: 18),

                    /// Panchayat Name
                    const Text(
                      "Panchayat Name *",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 8),

                    TextFormField(
                      controller: panchayatController.panchayatController,
                      decoration: InputDecoration(
                        hintText: "Enter Panchayat Name",

                        prefixIcon: const Icon(
                          Icons.home_work_outlined,
                          color: AppColors.primary,
                        ),

                        filled: true,
                        fillColor: Colors.white,

                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 18,
                        ),

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(
                            color: AppColors.primary,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// Save Button
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if (stateController.selectedStateId.value == null ||
                              districtController.selectedDistrictId.value ==
                                  null ||
                              assemblyController.selectedAssemblyId.value ==
                                  null ||
                              blockController.selectedBlockId.value == null ||
                              panchayatController.panchayatController.text
                                  .trim()
                                  .isEmpty) {
                            Get.snackbar(
                              "Validation",
                              "Please fill all fields",
                            );

                            return;
                          }

                          panchayatController.savePanchayat(
                            stateId: stateController.selectedStateId.value!,
                            districtId:
                                districtController.selectedDistrictId.value!,
                            assemblyId:
                                assemblyController.selectedAssemblyId.value!,
                            blockId: blockController.selectedBlockId.value!,
                          );
                        },
                        icon: const Icon(Icons.save_rounded),
                        label: const Text("Save Panchayat"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          minimumSize: const Size(double.infinity, 56),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
