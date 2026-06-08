import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/survey_employee_controller.dart';
import '../../model/survey_employee_model.dart';
import '../../utils/appColors.dart';

class SurveyEmployeeDetailsScreen extends StatelessWidget {
  final int employeeId;

  const SurveyEmployeeDetailsScreen({super.key, required this.employeeId});

  @override
  Widget build(BuildContext context) {
    final SurveyEmployeeController controller =
        Get.find<SurveyEmployeeController>();

    final EmployeeData employee = controller.filteredList.firstWhere(
      (e) => e.id == employeeId,
    );

    return Scaffold(
      backgroundColor: AppColors.lightBackground,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),

          child: Column(
            children: [
              /// APP BAR
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.back(),

                    child: Container(
                      padding: const EdgeInsets.all(15),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),

                      child: const Icon(Icons.arrow_back_ios_rounded, size: 20),
                    ),
                  ),

                  const Expanded(
                    child: Center(
                      child: Text(
                        "कर्मचारी विवरण",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 40),
                ],
              ),

              const SizedBox(height: 20),

              /// PROFILE CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(24),
                ),

                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 55,

                      backgroundImage:
                          employee.userImage != null &&
                              employee.userImage!.isNotEmpty
                          ? NetworkImage(
                              "https://aniltripathi.in${employee.userImage}",
                            )
                          : null,

                      child: employee.userImage == null
                          ? const Icon(Icons.person, size: 50)
                          : null,
                    ),

                    const SizedBox(height: 12),

                    Text(
                      employee.fullName ?? "N/A",

                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      employee.mobileNumber ?? "",

                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              /// PERSONAL INFO
              buildSection(
                title: "व्यक्तिगत जानकारी",
                children: [
                  detailTile("कर्मचारी आईडी", employee.id?.toString()),

                  detailTile("कर्मचारी का नाम", employee.fullName),

                  detailTile("पिता का नाम", employee.fatherName),

                  //   detailTile("जॉइनिंग तिथि", employee.joiningDate),

                  //   detailTile("निर्माण तिथि", employee.createdDate),
                ],
              ),

              /// CONTACT INFO
              buildSection(
                title: "संपर्क जानकारी",
                children: [
                  detailTile("मोबाइल नंबर", employee.mobileNumber),

                  detailTile("वैकल्पिक नंबर", employee.alternateNumber),

                  detailTile("ईमेल", employee.email),

                  detailTile("पता", employee.address),

                  detailTile("राज्य", employee.state),

                  detailTile("जिला", employee.district),
                ],
              ),

              /// IDENTITY
              buildSection(
                title: "पहचान संबंधी जानकारी",
                children: [
                  detailTile("पहचान पत्र प्रकार", employee.identityType),

                  detailTile("आधार संख्या", employee.aadhaarNumber),

                  detailTile("मतदाता पहचान पत्र", employee.voterID),
                ],
              ),

              /// VILLAGE
              buildSection(
                title: "गांव की जानकारी",
                children: [
                  detailTile("आवंटित गांव", employee.assignedVillageId),

                  detailTile(
                    "पूर्ण किए गए गांव",
                    employee.completedVillageName,
                  ),

                  detailTile("लंबित गांव", employee.pendingVillageName),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSection({required String title, required List<Widget> children}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,

            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.saffron,
            ),
          ),

          const SizedBox(height: 12),

          ...children,
        ],
      ),
    );
  }

  Widget detailTile(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Text(
              title,

              style: const TextStyle(
                color: AppColors.textLight,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Expanded(
            flex: 5,
            child: Text(
              value == null || value.isEmpty ? "N/A" : value,

              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
