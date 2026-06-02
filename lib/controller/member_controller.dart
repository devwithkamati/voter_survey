import 'package:get/get.dart';

import '../model/member_model.dart';
import '../service/member_service.dart';

class MemberController extends GetxController {
  /// ================= SERVICE =================
  final MemberService memberService = MemberService();

  /// ================= LOADING =================
  RxBool isLoading = false.obs;

  /// ================= MEMBER LIST =================
  RxList<MemberData> memberList = <MemberData>[].obs;

  /// ================= TOTAL MEMBER =================
  RxInt totalMember = 0.obs;

  /// ================= ERROR MESSAGE =================
  RxString errorMessage = ''.obs;

  /// ================= ON INIT =================
  @override
  void onInit() {
    super.onInit();

    getMemberApi();
  }

  /// ================= GET MEMBER API =================
  Future<void> getMemberApi() async {
    try {
      isLoading.value = true;

      errorMessage.value = '';

      final result = await memberService.getMembers();

      if (result != null && result.status == true) {
        /// MEMBER LIST
        memberList.assignAll(result.data ?? []);

        /// TOTAL MEMBER
        totalMember.value = result.totalMember ?? 0;

        print("Total Member : ${totalMember.value}");
      } else {
        errorMessage.value = result?.message ?? "No Data Found";
      }
    } catch (e) {
      errorMessage.value = e.toString();

      print("MEMBER CONTROLLER ERROR : $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// ================= REFRESH API =================
  Future<void> refreshApi() async {
    await getMemberApi();
  }
}
