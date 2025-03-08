import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsify/controller/local_news_controller.dart';
import 'package:newsify/pages/local_news/local_news_detail_page.dart';
import 'package:newsify/pages/local_news/local_news_form.dart';

class LocalNewsPage extends StatelessWidget {
  final LocalNewsController _localNewsController = Get.put(
    LocalNewsController(),
  );

  LocalNewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News List')),
      body: Obx(
        () => ListView.builder(
          itemCount: _localNewsController.newsList.length,
          itemBuilder: (context, index) {
            final news = _localNewsController.newsList[index];
            return ListTile(
              title: Text(news.title ?? 'No Title'),
              subtitle: Text(news.content ?? 'No Content'),
              leading:
                  news.imageUrl != null
                      ? Image.file(
                        File(news.imageUrl!),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      )
                      : const Icon(Icons.image),
              onTap: () {
                Get.to(() => LocalNewsDetailPage(news: news));
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => LocalNewsForm());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
