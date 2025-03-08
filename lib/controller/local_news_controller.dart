import 'package:get/get.dart';
import 'package:newsify/database/local/database_helper.dart';
import 'package:newsify/model/local_news_model.dart';

class LocalNewsController extends GetxController {
  var newsList = <LocalNewsModel>[].obs;
  final DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  void onInit() {
    fetchNews();
    super.onInit();
  }

  Future<void> fetchNews() async {
    final news = await _dbHelper.getNews();
    newsList.assignAll(news);
  }

  Future<void> addNews(LocalNewsModel news) async {
    await _dbHelper.insertNews(news);
    fetchNews();
  }

  Future<void> updateNews(LocalNewsModel news) async {
    await _dbHelper.updateNews(news);
    fetchNews();
  }

  Future<void> deleteNews(int id) async {
    await _dbHelper.deleteNews(id);
    fetchNews();
  }
}
