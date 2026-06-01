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
      isLoading(true);

      errorMessage.value = '';

      final result = await memberService.getMembers();

      if (result != null && result.status == true && result.data != null) {
        memberList.assignAll(result.data!);
      } else {
        errorMessage.value = result?.message ?? "No Data Found";
      }
    } catch (e) {
      errorMessage.value = e.toString();

      print("CONTROLLER ERROR : $e");
    } finally {
      isLoading(false);
    }
  }

  /// ================= REFRESH API =================
  Future<void> refreshApi() async {
    await getMemberApi();
  }
}
