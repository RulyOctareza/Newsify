import 'package:get/get.dart';
import 'package:newsify/controller/auth_controller.dart';
import 'package:newsify/controller/category_controller.dart';

class ControllerBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => CategoryController(), fenix: true);
  }
}
