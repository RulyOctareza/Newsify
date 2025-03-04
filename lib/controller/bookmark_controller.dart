import 'dart:convert';

import 'package:get/get.dart';
import 'package:newsify/model/news_api_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkController extends GetxController {
  final bookmarkedNews = <NewsApiModel>[].obs;

  void loadBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final bookmarks = prefs.getStringList('bookmarks');
    if (bookmarks != null) {
      bookmarkedNews.value =
          bookmarks.map((e) => NewsApiModel.fromJson(jsonDecode(e))).toList();
    }
  }

  void saveBookmarks() async {
    final prefs = await SharedPreferences.getInstance();
    final bookmarks =
        bookmarkedNews.map((e) => jsonEncode(e.toJson())).toList();
    prefs.setStringList('bookmarks', bookmarks);
  }

  void addBookmark(NewsApiModel news) {
    if (!bookmarkedNews.contains(news)) {
      bookmarkedNews.add(news);
      saveBookmarks();
    }
  }

  void removeBookmark(NewsApiModel news) {
    bookmarkedNews.remove(news);
    saveBookmarks();
  }

  bool isBookmarked(NewsApiModel news) {
    return bookmarkedNews.contains(news);
  }
}
