import 'package:get/get.dart';

import '../model/block_model.dart';
import '../service/block_service.dart';

class BlockController extends GetxController {
  final BlockService _service = BlockService();

  RxList<BlockModel> blockList = <BlockModel>[].obs;

  RxnInt selectedBlockId = RxnInt();

  RxBool isLoading = false.obs;

  Future<void> getBlocks(int assemblyId) async {
    try {
      isLoading.value = true;

      final response = await _service.getBlocks(assemblyId);

      if (response.statusCode == 200) {
        blockList.value = (response.data as List)
            .map((e) => BlockModel.fromJson(e))
            .toList();
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
