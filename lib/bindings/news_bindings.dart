import 'package:get/get.dart';
import 'package:newsify/controller/news_controller.dart';

class NewsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsController(), fenix: true);
  }
}
