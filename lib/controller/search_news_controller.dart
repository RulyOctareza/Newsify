import 'dart:developer';

import 'package:get/get.dart';
import 'package:newsify/controller/data/api_services.dart';
import 'package:newsify/model/news_api_model.dart';

class SearchNewsController extends GetxController {
  var searchresult = <NewsApiModel>[].obs;
  var isLoading = false.obs;
  final ApiServices apiServices = ApiServices();

  Future<void> searchNews(String keyword) async {
    try {
      isLoading(true);
      final results = await apiServices.searchNews(keyword);
      if (results != null) {
        searchresult.assignAll(results);
      } else {
        searchresult.clear();
      }
    } catch (e) {
      log("Error searching news: $e");
    } finally {
      isLoading(false);
    }
  }
}
