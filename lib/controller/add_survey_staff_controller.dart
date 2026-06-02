// import 'dart:io';
//
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
//
// import '../service/apiUrl.dart';
//
// class AddSurveyStaffController extends GetxController {
//   final isLoading = false.obs;
//
//   Future<void> addSurveyStaff({
//     required String fullName,
//     required String fatherName,
//     required String mobileNumber,
//     required String alternateNumber,
//     required String email,
//     required String address,
//     required String state,
//     required String district,
//     required String aadhaarNumber,
//     required String voterId,
//     required String password,
//     File? userImage,
//     File? aadhaarImage,
//     File? panImage,
//     File? voterImage,
//     File? drivingLicenseImage,
//   }) async {
//     try {
//       isLoading.value = true;
//
//       var request = http.MultipartRequest(
//         "POST",
//         Uri.parse(ApiUrls.addSurveyEmployee),
//       );
//
//       request.fields["FullName"] = fullName;
//       request.fields["FatherName"] = fatherName;
//       request.fields["MobileNumber"] = mobileNumber;
//       request.fields["AlternateNumber"] = alternateNumber;
//       request.fields["Email"] = email;
//       request.fields["Address"] = address;
//       request.fields["State"] = state;
//       request.fields["District"] = district;
//       request.fields["AadhaarNumber"] = aadhaarNumber;
//       request.fields["VoterID"] = voterId;
//       request.fields["Password"] = password;
//
//       if (userImage != null) {
//         request.files.add(
//           await http.MultipartFile.fromPath("UserImage", userImage.path),
//         );
//       }
//
//       if (aadhaarImage != null) {
//         request.files.add(
//           await http.MultipartFile.fromPath("AdharImage", aadhaarImage.path),
//         );
//       }
//
//       if (panImage != null) {
//         request.files.add(
//           await http.MultipartFile.fromPath("PanImage", panImage.path),
//         );
//       }
//
//       if (voterImage != null) {
//         request.files.add(
//           await http.MultipartFile.fromPath("VoterIdImage", voterImage.path),
//         );
//       }
//
//       if (drivingLicenseImage != null) {
//         request.files.add(
//           await http.MultipartFile.fromPath(
//             "DrivingLicenseImage",
//             drivingLicenseImage.path,
//           ),
//         );
//       }
//
//       final response = await request.send();
//
//       final responseBody = await response.stream.bytesToString();
//
//       print(responseBody);
//
//       if (response.statusCode == 200) {
//         Get.snackbar("Success", "Survey Staff Added Successfully");
//       } else {
//         Get.snackbar("Error", "Failed To Add Survey Staff");
//       }
//     } catch (e) {
//       print(e);
//       Get.snackbar("Error", e.toString());
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:voter_survey_admin/view/dashbord_screen.dart';

import '../service/apiUrl.dart';

class AddSurveyStaffController extends GetxController {
  final isLoading = false.obs;

  Future<void> addSurveyStaff({
    required String FullName,
    required String FatherName,
    required String MobileNumber,
    required String AlternateNumber,
    required String Email,
    required String Address,
    required String State,
    required String District,
    required String AadhaarNumber,
    required String VoterId,
    required String Password,
    String assignedVillageId = "",
    File? userImage,
    File? aadhaarImage,
    File? panImage,
    File? voterImage,
    File? drivingLicenseImage,
  }) async {
    try {
      isLoading.value = true;

      var request = http.MultipartRequest(
        "POST",
        Uri.parse(ApiUrls.addSurveyEmployee),
      );

      /// TEXT DATA
      request.fields["FullName"] = FullName;
      request.fields["FatherName"] = FatherName;
      request.fields["MobileNumber"] = MobileNumber;
      request.fields["AlternateNumber"] = AlternateNumber;
      request.fields["Email"] = Email;
      request.fields["Address"] = Address;
      request.fields["State"] = State;
      request.fields["District"] = District;
      request.fields["IdentityType"] = "Aadhaar";
      request.fields["AadhaarNumber"] = AadhaarNumber;
      request.fields["VoterID"] = VoterId;
      request.fields["Password"] = Password;
      request.fields["AssignedVillageId"] = assignedVillageId;

      /// IMAGES
      if (userImage != null) {
        request.files.add(
          await http.MultipartFile.fromPath("UserImage", userImage.path),
        );
      }

      if (aadhaarImage != null) {
        request.files.add(
          await http.MultipartFile.fromPath("AdharImage", aadhaarImage.path),
        );
      }

      if (panImage != null) {
        request.files.add(
          await http.MultipartFile.fromPath("PanImage", panImage.path),
        );
      }

      if (voterImage != null) {
        request.files.add(
          await http.MultipartFile.fromPath("VoterIdImage", voterImage.path),
        );
      }

      if (drivingLicenseImage != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            "DrivingLicenseImage",
            drivingLicenseImage.path,
          ),
        );
      }

      final response = await request.send();

      final responseBody = await response.stream.bytesToString();

      debugPrint("Status Code : ${response.statusCode}");
      debugPrint("Response : $responseBody");

      if (response.statusCode == 200) {
        Get.snackbar(
          "Success",
          "Survey Staff Added Successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          margin: const EdgeInsets.all(12),
          duration: const Duration(seconds: 2),
        );

        Future.delayed(const Duration(milliseconds: 800), () {
          Get.offAll(() => const DashBoardScreen());
        });
      } else {
        String errorMessage = "Failed To Add Survey Staff";

        try {
          final data = jsonDecode(responseBody);

          errorMessage = data["Message"] ?? data["message"] ?? errorMessage;
        } catch (_) {}

        Get.snackbar(
          "Error",
          errorMessage,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          margin: const EdgeInsets.all(12),
        );
      }
    } catch (e) {
      debugPrint("Add Survey Staff Error : $e");

      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        margin: const EdgeInsets.all(12),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
