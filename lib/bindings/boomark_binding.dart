import 'package:get/get.dart';
import 'package:newsify/controller/bookmark_controller.dart';

class BoomarkBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookmarkController(), fenix: true);
  }
}
