import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../controller/add_survey_staff_controller.dart';
import '../../utils/appColors.dart';

class AddSurveyStaffScreen extends StatefulWidget {
  const AddSurveyStaffScreen({super.key});

  @override
  State<AddSurveyStaffScreen> createState() => _AddSurveyStaffScreenState();
}

class _AddSurveyStaffScreenState extends State<AddSurveyStaffScreen> {
  final fullNameController = TextEditingController();
  final fatherNameController = TextEditingController();
  final mobileController = TextEditingController();
  final alternateController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final districtController = TextEditingController();
  final voterIdController = TextEditingController();
  final passwordController = TextEditingController();

  final AddSurveyStaffController controller = Get.put(
    AddSurveyStaffController(),
  );
  String? selectedState;
  final aadhaarController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  File? userImage;
  File? aadhaarImage;
  File? panImage;
  File? voterImage;
  File? dlImage;

  final List<String> indianStates = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal",
  ]..sort();

  Future<void> pickImage(String type) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );

    if (pickedFile == null) return;

    setState(() {
      switch (type) {
        case "user":
          userImage = File(pickedFile.path);
          break;

        case "aadhaar":
          aadhaarImage = File(pickedFile.path);
          break;

        case "pan":
          panImage = File(pickedFile.path);
          break;

        case "voter":
          voterImage = File(pickedFile.path);
          break;

        case "dl":
          dlImage = File(pickedFile.path);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [
              /// HEADER
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

                  /// 🔥 CENTER TITLE
                  Expanded(
                    child: Center(
                      child: const Text(
                        "Add Survey Staff",

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
              SizedBox(height: 30),

              /// PERSONAL INFO
              sectionCard(
                title: "Personal Information",
                icon: Icons.person,
                child: Column(
                  children: [
                    customField(
                      hint: "Full Name",
                      icon: Icons.person,
                      controller: fullNameController,
                    ),

                    customField(
                      hint: "Father Name",
                      icon: Icons.family_restroom,
                      controller: fatherNameController,
                    ),

                    customField(
                      hint: "Mobile Number",
                      icon: Icons.phone,
                      controller: mobileController,
                    ),

                    customField(
                      hint: "Alternate Number",
                      icon: Icons.phone_android,
                      controller: alternateController,
                    ),

                    customField(
                      hint: "Email",
                      icon: Icons.email,
                      controller: emailController,
                    ),

                    customField(
                      hint: "Password",
                      icon: Icons.lock,
                      controller: passwordController,
                      obscureText: true,
                    ),
                  ],
                ),
              ),

              /// ADDRESS
              sectionCard(
                title: "Address Information",
                icon: Icons.location_on,
                child: Column(
                  children: [
                    customField(
                      hint: "Address",
                      icon: Icons.home,
                      maxLines: 3,
                      controller: aadhaarController,
                    ),

                    // customField(hint: "State", icon: Icons.map),
                    Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      child: DropdownButtonFormField<String>(
                        value: selectedState,
                        decoration: InputDecoration(
                          hintText: "State",
                          prefixIcon: const Icon(
                            Icons.map,
                            color: AppColors.saffron,
                          ),
                          filled: true,
                          fillColor: AppColors.background,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: const BorderSide(
                              color: AppColors.saffron,
                              width: 1.5,
                            ),
                          ),
                        ),
                        items: indianStates.map((state) {
                          return DropdownMenuItem(
                            value: state,
                            child: Text(state),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedState = value;
                          });
                        },
                      ),
                    ),

                    customField(
                      hint: "District",
                      icon: Icons.location_city,
                      controller: districtController,
                    ),
                  ],
                ),
              ),

              /// IDENTITY
              sectionCard(
                title: "Identity Information",
                icon: Icons.badge,
                child: Column(
                  children: [
                    TextFormField(
                      controller: aadhaarController,
                      keyboardType: TextInputType.number,
                      maxLength: 12,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(12),
                      ],
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Enter Aadhaar Number";
                        }

                        if (value.length != 12) {
                          return "Aadhaar must be 12 digits";
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: "Aadhaar Number",
                        prefixIcon: const Icon(
                          Icons.credit_card,
                          color: AppColors.saffron,
                        ),
                        filled: true,
                        fillColor: AppColors.background,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    customField(
                      hint: "Voter ID",
                      icon: Icons.how_to_vote,
                      controller: voterIdController,
                    ),
                  ],
                ),
              ),

              /// DOCUMENTS
              sectionCard(
                title: "Upload Documents",
                icon: Icons.upload_file,
                child: Column(
                  children: [
                    // uploadTile("User Image"),
                    //
                    // uploadTile("Aadhaar Image"),
                    //
                    // uploadTile("PAN Image"),
                    //
                    // uploadTile("Voter ID Image"),
                    //
                    // uploadTile("Driving License Image"),
                    uploadTile(
                      "User Image",
                      userImage,
                      () => pickImage("user"),
                    ),

                    uploadTile(
                      "Aadhaar Image",
                      aadhaarImage,
                      () => pickImage("aadhaar"),
                    ),

                    uploadTile("PAN Image", panImage, () => pickImage("pan")),

                    uploadTile(
                      "Voter ID Image",
                      voterImage,
                      () => pickImage("voter"),
                    ),

                    uploadTile(
                      "Driving License Image",
                      dlImage,
                      () => pickImage("dl"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              /// SAVE BUTTON
              // SizedBox(
              //   width: double.infinity,
              //   height: 52,
              //
              //   child: Container(
              //     decoration: BoxDecoration(
              //       gradient: AppColors.primaryGradient,
              //       borderRadius: BorderRadius.circular(18),
              //     ),
              //
              //     child: const Center(
              //       child: Text(
              //         "Save Staff",
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontSize: 18,
              //           fontWeight: FontWeight.w700,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              Obx(
                () => SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: InkWell(
                    onTap: controller.isLoading.value
                        ? null
                        : () {
                            controller.addSurveyStaff(
                              FullName: fullNameController.text.trim(),
                              FatherName: fatherNameController.text.trim(),
                              MobileNumber: mobileController.text.trim(),
                              AlternateNumber: alternateController.text.trim(),
                              Email: emailController.text.trim(),
                              Address: addressController.text.trim(),
                              State: selectedState ?? "",
                              District: districtController.text.trim(),
                              AadhaarNumber: aadhaarController.text.trim(),
                              VoterId: voterIdController.text.trim(),
                              Password: passwordController.text.trim(),

                              userImage: userImage,
                              aadhaarImage: aadhaarImage,
                              panImage: panImage,
                              voterImage: voterImage,
                              drivingLicenseImage: dlImage,
                            );
                          },
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Center(
                        child: controller.isLoading.value
                            ? const SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2.5,
                                ),
                              )
                            : const Text(
                                "Save Staff",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                      ),
                    ),
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

  Widget sectionCard({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),

                decoration: BoxDecoration(
                  color: AppColors.saffron.withOpacity(.12),
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Icon(icon, color: AppColors.saffron),
              ),

              const SizedBox(width: 12),

              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          child,
        ],
      ),
    );
  }

  // Widget customField({
  //   required String hint,
  //   required IconData icon,
  //   int maxLines = 1,
  // }) {
  //   return Container(
  //     margin: const EdgeInsets.only(bottom: 12),
  //
  //     child: TextFormField(
  //       maxLines: maxLines,
  //
  //       decoration: InputDecoration(
  //         hintText: hint,
  //
  //         prefixIcon: Icon(icon, color: AppColors.saffron),
  //
  //         filled: true,
  //         fillColor: AppColors.background,
  //
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(18),
  //           borderSide: BorderSide.none,
  //         ),
  //
  //         enabledBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(18),
  //           borderSide: BorderSide.none,
  //         ),
  //
  //         focusedBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(18),
  //           borderSide: const BorderSide(color: AppColors.saffron, width: 1.5),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget customField({
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    int maxLines = 1,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,

          prefixIcon: Icon(icon, color: AppColors.saffron),

          filled: true,
          fillColor: AppColors.background,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide.none,
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: AppColors.saffron, width: 1.5),
          ),
        ),
      ),
    );
  }

  Widget uploadTile(String title, File? imageFile, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          if (imageFile != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(
                imageFile,
                width: 55,
                height: 55,
                fit: BoxFit.cover,
              ),
            )
          else
            const Icon(
              Icons.cloud_upload_rounded,
              color: AppColors.saffron,
              size: 40,
            ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          ),

          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.saffron,
              foregroundColor: Colors.white,
            ),
            child: Text(imageFile == null ? "Choose" : "Change"),
          ),
        ],
      ),
    );
  }
}
