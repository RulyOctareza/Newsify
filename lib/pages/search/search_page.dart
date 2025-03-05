import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:newsify/controller/search_news_controller.dart';
import 'package:newsify/static/card/news_card.dart';
import 'package:newsify/static/custom/custom_appbar_news_header.dart';
import 'package:newsify/static/style/typography.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final SearchNewsController searchController = Get.put(SearchNewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: NewsHeader(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              onSubmitted: (keyword) {
                searchController.searchNews(keyword);
              },
              decoration: InputDecoration(
                hintText: "What are you looking for?",
                hintStyle: regularTextStyle,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 12),
            Expanded(
              child: Obx(() {
                if (searchController.isLoading.value) {
                  return Center(
                    child: Lottie.asset(
                      'assets/loading_animation.json',
                      width: 150,
                      height: 150,
                    ),
                  );
                }

                if (searchController.searchresult.isEmpty) {
                  return Center(child: Text('No results found'));
                }

                return ListView.builder(
                  itemCount: searchController.searchresult.length,
                  itemBuilder: (context, index) {
                    final news = searchController.searchresult[index];
                    return NewsCard(
                      news: news,
                      imageUrl: news.urlToImage ?? '',
                      title: news.title ?? '',
                      description: news.description ?? '',
                      onTap: () {
                        Get.toNamed('/detail', arguments: news.url);
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
