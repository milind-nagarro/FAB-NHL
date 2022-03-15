import 'package:fab_nhl/common/storage/local_storage.dart';
import 'package:fab_nhl/route/route_paths.dart' as path;
import 'package:get/get.dart';

/// Controller for welcome screen
/// Handles page swipe and (observable) current page state
/// Stores and updates (observable) titles based on current page
class WelcomeController extends GetxController {
  /// navigation to login screen
  void navigateToLogin() async {
    var userInfo = await LocalStorage.getUserInfo();
    // if user info is stored we go to pin screen, if not to login screen
    if (userInfo != null) {
      Get.toNamed(path.loginPin);
    } else {
      Get.toNamed(path.login);
    }
  }

  /// navigation to register screen
  void navigateToRegister() {
    Get.toNamed(path.registerMobile);
  }
}
