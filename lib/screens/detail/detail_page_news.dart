import 'package:flutter/material.dart';
import 'package:newsify/static/card/news_headline_detail.dart';
import 'package:newsify/static/custom/custom_newsheader.dart';
import 'package:newsify/static/style/colors.dart';
import 'package:newsify/static/style/typography.dart';

class DetailPageNews extends StatelessWidget {
  const DetailPageNews({super.key});

  @override
  Widget build(BuildContext context) {
    final String dummyNews =
        'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.';
    return Scaffold(
      appBar: NewsHeader(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back, size: 28, color: darkGreen),
                ),
                Spacer(),
                InkWell(
                  onTap: () {},
                  child: SizedBox(
                    height: 28,
                    width: 55,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/share_button_light.png'),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: SizedBox(
                    height: 28,
                    width: 55,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/bookmark_unclicked.png'),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            NewsHeadlineDetail(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    dummyNews + dummyNews + dummyNews,
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
  }
}
