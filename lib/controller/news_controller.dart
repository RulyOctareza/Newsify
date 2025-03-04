import 'dart:developer';

import 'package:get/get.dart';
import 'package:newsify/model/news_api_model.dart';
import 'package:newsify/services/api/api_endpoint.dart';
import 'package:newsify/controller/category_controller.dart';

class NewsController extends GetxController {
  var isLoading = true.obs;
  var newsList = <NewsApiModel>[].obs;
  final CategoryController categoryController = Get.find();
  final ApiEndpoint apiEndpoint = ApiEndpoint();

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  Future<void> fetchNews() async {
    try {
      isLoading(true);
      final url = categoryController.getApiUrl();
      final news = await apiEndpoint.getNews(url);
      if (news != null && news.isNotEmpty) {
        newsList.assignAll(news);
      } else {
        newsList.clear();
      }
    } catch (e) {
      log("Error fetching news: $e");
    } finally {
      isLoading(false);
    }
  }
}
