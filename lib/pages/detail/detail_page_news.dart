// ignore_for_file: public_member_api_docs, sort_constructors_first, unnecessary_null_comparison
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:newsify/controller/bookmark_controller.dart';

import 'package:newsify/controller/data/api_services.dart';
import 'package:newsify/pages/error/error_page.dart';
import 'package:newsify/static/card/dialog_share.dart';
import 'package:newsify/static/card/news_headline_detail.dart';
import 'package:newsify/static/custom/custom_appbar_news_header.dart';
import 'package:newsify/static/style/colors.dart';
import 'package:newsify/static/style/typography.dart';

class DetailPageNews extends StatelessWidget {
  final String newsUrl;
  const DetailPageNews({super.key, required this.newsUrl});

  @override
  Widget build(BuildContext context) {
    final BookmarkController bookmarkController =
        Get.find<BookmarkController>();
    return FutureBuilder(
      future: ApiServices().getNewsbyId(newsUrl),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          log(newsUrl);
          return Scaffold(
            body: Center(
              child: Lottie.asset(
                'assets/loading_animation.json',
                width: 150,
                height: 150,
              ),
            ),
          );
        }

        if (snapshot.hasError) {
          log(newsUrl);
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data == null) {
          log('Ini adalah alamat $newsUrl $snapshot');
          return SomethingWrong();
        }

        final news = snapshot.data!;
        return Scaffold(
          appBar: NewsHeader(),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.toNamed('/homepage' ,);
                        
                      },
                      icon: Icon(Icons.arrow_back, size: 28, color: darkGreen),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        showShareDialog(context);
                      },
                      child: SizedBox(
                        height: 28,
                        width: 55,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/share_button_light.png',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => InkWell(
                        onTap: () {
                          if (bookmarkController.isBookmarked(news)) {
                            bookmarkController.removeBookmark(news);
                          } else {
                            bookmarkController.addBookmark(news);
                          }
                        },
                        child: SizedBox(
                          height: 28,
                          width: 55,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  bookmarkController.isBookmarked(news)
                                      ? 'assets/bookmark_clicked.png'
                                      : 'assets/bookmark_unclicked.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                NewsHeadlineDetail(
                  newsUrl: news.url!,
                  title: news.title!,
                  imageUrl:
                      news.urlToImage?.isNotEmpty == true
                          ? news.urlToImage!
                          : 'assets/image_onboarding1.jpg',
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text(
                        news.publishedAt!.toString() != null
                            ? DateFormat(
                              'EEE, dd-MM-yy, HH:mm',
                            ).format(news.publishedAt!).toString()
                            : '',
                        textAlign: TextAlign.left,
                        style: regularTextStyle,
                      ),
                      SizedBox(width: 12),
                      Text(
                        'Author : ${news.author ?? "unknown"}',
                        textAlign: TextAlign.left,
                        style: semiBoldTextStyle,
                      ),
                      SizedBox(height: 8),
                      Text(
                        news.description!,
                        style: regularTextStyle.copyWith(fontSize: 18),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
        );
      },
    );
  }
}
