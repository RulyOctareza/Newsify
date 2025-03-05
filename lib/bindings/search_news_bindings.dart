import 'package:get/get.dart';
import 'package:newsify/controller/search_news_controller.dart';

class SearchNewsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchNewsController(), fenix: true);
  }
}
