import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsify/controller/bookmark_controller.dart';
import 'package:newsify/model/news_api_model.dart';
import 'package:newsify/static/card/dialog_share.dart';
import 'package:newsify/static/style/colors.dart';

class NewsCard extends StatelessWidget {
  final NewsApiModel news;
  final String imageUrl;
  final String title;
  final String? description;
  final VoidCallback onTap;

  const NewsCard({
    super.key,
    required this.onTap,
    required this.imageUrl,
    required this.title,
    required this.news,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    final BookmarkController bookmarkController =
        Get.find<BookmarkController>();
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Image.network(
                  imageUrl.isNotEmpty ? imageUrl : '',
                  fit: BoxFit.cover,
                  height: 150,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/image_onboarding2.jpg',
                      fit: BoxFit.cover,
                      height: 150,
                    );
                  },
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [green, sageGreen],
                      begin: Alignment.center,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        description ?? '',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              showShareDialog(context);
                            },
                            child: Container(
                              height: 50,
                              width: 60,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/share_button_light.png',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Obx(
                            () => IconButton(
                              onPressed: () {
                                if (bookmarkController.isBookmarked(news)) {
                                  bookmarkController.removeBookmark(news);
                                } else {
                                  bookmarkController.addBookmark(news);
                                }
                              },
                              icon: Image.asset(
                                bookmarkController.isBookmarked(news)
                                    ? 'assets/bookmark_clicked.png'
                                    : 'assets/bookmark_unclicked.png',
                                scale: 5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
