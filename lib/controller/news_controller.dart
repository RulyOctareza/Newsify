import 'dart:developer';
import 'package:get/get.dart';
import 'package:newsify/model/news_api_model.dart';
import 'package:newsify/services/api/api_endpoint.dart';

class NewsController extends GetxController {
  var isLoading = true.obs;
  var newsList = <NewsApiModel>[].obs;

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  Future<void> fetchNews() async {
    try {
      isLoading(true);
      var news = await ApiEndpoint().getNews();
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
