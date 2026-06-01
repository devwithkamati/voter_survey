import 'package:get_storage/get_storage.dart';

class StorageService {
  static final box = GetStorage();

  /// 🔥 SAVE LOGIN
  static saveLogin(bool value) {
    box.write("isLogin", value);
  }

  /// 🔥 GET LOGIN STATUS
  static bool getLogin() {
    return box.read("isLogin") ?? false;
  }

  /// 🔥 LOGOUT
  static logout() {
    box.erase();
  }
}
