import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsify/controller/auth_controller.dart';
import 'package:newsify/controller/bookmark_controller.dart';
import 'package:newsify/controller/category_controller.dart';
import 'package:newsify/controller/news_controller.dart';
import 'package:newsify/pages/detail/dummy_category.dart';
import 'package:newsify/static/card/news_card.dart';
import 'package:newsify/static/custom/custom_appbar_news_header.dart';
import 'package:newsify/static/style/typography.dart';

class NewsPage extends StatelessWidget {
  final CategoryController categoryController = Get.put(CategoryController());
  final AuthController authController = Get.find<AuthController>();
  final NewsController newsController = Get.find<NewsController>();
  final BookmarkController bookmarkController = Get.find<BookmarkController>();

  NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewsHeader(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "What are you looking for?",
                hintStyle: regularTextStyle,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Categories
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                    categories.map((category) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Obx(
                          () => ChoiceChip(
                            label: Text(category),
                            selected:
                                categoryController.selectedCategory.value ==
                                category,
                            selectedColor: Colors.green,
                            backgroundColor: Colors.grey,
                            onSelected: (bool selected) {
                              categoryController.selectCategory(category);
                            },
                          ),
                        ),
                      );
                    }).toList(),
              ),
            ),

            const SizedBox(height: 10),

            // News List
            Expanded(
              child: Obx(() {
                if (newsController.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (newsController.newsList.isEmpty) {
                  return const Center(child: Text("No news found"));
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  itemCount: newsController.newsList.length,
                  itemBuilder: (context, index) {
                    final news = newsController.newsList[index];
                    return NewsCard(
                      news: news,
                      onTap: () => Get.toNamed('/detail', arguments: news.url),
                      imageUrl: news.urlToImage ?? '',
                      title: news.title ?? '',
                      description: news.description ?? '',
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
