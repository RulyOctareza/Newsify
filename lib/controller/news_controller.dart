import 'dart:developer';

import 'package:get/get.dart';
import 'package:newsify/model/news_api_model.dart';
import 'package:newsify/controller/data/api_services.dart';
import 'package:newsify/controller/category_controller.dart';
import 'package:newsify/pages/error/error_page.dart';

class NewsController extends GetxController {
  var isLoading = true.obs;
  var newsList = <NewsApiModel>[].obs;
  var allNewsList = <NewsApiModel>[].obs;
  final CategoryController categoryController = Get.find();
  final ApiServices apiServices = ApiServices();

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  Future<void> fetchNews() async {
    try {
      isLoading(true);
      final url = categoryController.getApiUrl();
      final news = await apiServices.getNews(url);
      if (news != null && news.isNotEmpty) {
        newsList.assignAll(news);
        allNewsList.addAll(news);
      } else {
        newsList.clear();
      }
    } catch (e) {
      SomethingWrong();
      log("Error fetching news: $e");
    } finally {
      isLoading(false);
    }
  }
}
