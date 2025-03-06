import 'package:get/get.dart';
import 'package:newsify/controller/settings_profile_controller.dart';

class SettingsControllerBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsProfileController(), fenix: true);
  }
}
