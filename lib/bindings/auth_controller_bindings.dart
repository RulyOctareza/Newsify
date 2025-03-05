import 'package:get/get.dart';
import 'package:newsify/controller/auth_controller.dart';

class AuthControllerBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(), fenix: true);
  }
}
