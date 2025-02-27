import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsify/controller/category_controller.dart';
import 'package:newsify/screens/detail/dummy_category.dart';
import 'package:newsify/screens/detail/dummy_news.dart';
import 'package:newsify/static/card/news_card.dart';
import 'package:newsify/static/custom/newsheader.dart';
import 'package:newsify/static/style/typography.dart';

class HomePage extends StatelessWidget {
  final CategoryController categoryController = Get.put(CategoryController());

  HomePage({super.key});

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

                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),

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

            SizedBox(height: 10),

            // News List
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 5),
                itemCount: news.length,
                itemBuilder: (context, index) {
                  return NewsCard(
                    onTap: () => Get.toNamed('/detail'),
                    imageUrl: news[index]['image']!,
                    title: news[index]['title']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
