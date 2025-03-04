import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:newsify/model/news_api_model.dart';

class ApiEndpoint {
  Dio dio = Dio();
  static const url =
      'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=318123271b444e41b414c18aec72dd17';

  Future<List<NewsApiModel>?> getNews() async {
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
      log('$newsList');
      return newsList;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  Future<NewsApiModel?> getNewsbyId(String id) async {
    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final data = response.data;
        final newsList =
            (data['articles'] as List)
                .map((e) => NewsApiModel.fromJson(e))
                .toList();

        return newsList.firstWhereOrNull((news) => news.url == id);
      }
      return null;
    } catch (e, stacktrace) {
      log(e.toString());
      log(stacktrace.toString());
    }
    return null;
  }
}
