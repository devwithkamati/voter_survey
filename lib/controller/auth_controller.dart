import 'package:get_storage/get_storage.dart';

class StorageService {
  static final box = GetStorage();

  //static final box = GetStorage();

  static const String employeeIdKey = "employeeId";

  static void saveEmployeeId(int id) {
    box.write(employeeIdKey, id);
  }

  static int getEmployeeId() {
    return box.read(employeeIdKey) ?? 0;
  }

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
