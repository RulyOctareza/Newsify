import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:newsify/static/style/colors.dart';

class NewsCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  const NewsCard({super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Image.network(imageUrl, fit: BoxFit.cover, height: 150),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(12),
                height: 150,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [green, sageGreen],
                    begin: Alignment.center,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            log('Share tapped !');
                          },
                          child: Container(
                            height: 50,
                            width: 60,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  'assets/share_button_light.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            log('Bookmarked tapped !');
                          },
                          icon: Image.asset(
                            'assets/bookmark_unclicked.png',
                            scale: 5,
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
    );
  }
}
