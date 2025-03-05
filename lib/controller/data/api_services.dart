import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';
import 'package:newsify/controller/category_controller.dart';
import 'package:newsify/controller/news_controller.dart';
import 'package:newsify/model/news_api_model.dart';

class ApiServices {
  Dio dio = Dio();
  final String apiKey = dotenv.env['NEWS_API_KEY'] ?? '';

  Future<List<NewsApiModel>?> getNews(String url) async {
    if (url.isEmpty) {
      log("Error: URL is empty");
      return null;
    }
    try {
      final response = await dio.get(url);
      final data = response.data;
      List<NewsApiModel> newsList = [];
      for (var news in data["articles"]) {
        if (news["title"] == "[Removed]") continue;
        newsList.add(NewsApiModel.fromJson(news));
      }
      // log('$newsList');
      return newsList;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<NewsApiModel?> getNewsbyId(String id) async {
    final String url = CategoryController().getApiUrl();
    try {
      final response = await dio.get(url);
      final newsController = Get.find<NewsController>();

      if (response.statusCode == 200 || response.statusCode == 201) {
        // final data = response.data;
        // final newsList =
        //     (data['articles'] as List)
        //         .map((e) => NewsApiModel.fromJson(e))
        //         .toList();

        return newsController.allNewsList.firstWhereOrNull(
          (news) => news.url == id,
        );
      }
    } catch (e, stacktrace) {
      log(e.toString());
      log(stacktrace.toString());
    }
    return null;
  }
}
