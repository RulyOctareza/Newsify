import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsify/controller/bookmark_controller.dart';

import 'package:newsify/static/card/news_card.dart';
import 'package:newsify/static/custom/custom_appbar_news_header.dart';
import 'package:newsify/static/style/typography.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  final BookmarkController bookmarkController = Get.find();

  // final List<String> optionsdropdown = [
  //   'This Month',
  //   'Last Month',
  //   'This Week',
  //   'Last Week',
  // ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewsHeader(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/logo_small.png'),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  'Saved Page',
                  style: semiBoldTextStyle.copyWith(fontSize: 20),
                ),
                const SizedBox(width: 16),
                // DropdownButton<String>(
                //   focusColor: Colors.grey,
                //   hint: Text('Pilih Waktu', style: semiBoldTextStyle),
                //   value: selectedValue,
                //   items:
                //       optionsdropdown.map((String value) {
                //         return DropdownMenuItem(
                //           value: value,
                //           child: Text(value),
                //         );
                //       }).toList(),
                //   onChanged: (String? newvalue) {

                //       selectedValue = newvalue;

                //   },
                // ),
              ],
            ),
            const SizedBox(height: 16),

            Expanded(
              child: Obx(() {
                if (bookmarkController.bookmarkedNews.isEmpty) {
                  return Center(
                    child: Text('No bookmarks yet', style: regularTextStyle),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  itemCount: bookmarkController.bookmarkedNews.length,
                  itemBuilder: (context, index) {
                    final news = bookmarkController.bookmarkedNews[index];
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
