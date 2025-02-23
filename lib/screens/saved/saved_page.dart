import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:newsify/screens/menu/menu.dart';
import 'package:newsify/screens/settings/setting_profile_page.dart';
import 'package:newsify/static/card/news_card.dart';
import 'package:newsify/static/style/colors.dart';
import 'package:newsify/static/style/typography.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<SavedPage> {
  final List<String> categories = [
    "Trending",
    "Politics",
    "Sports",
    "Business",
    "Tech",
  ];

  //dummy news

  final List<Map<String, String>> news = [
    {
      "image":
          "https://images.unsplash.com/photo-1504711434969-e33886168f5c?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", // Ganti dengan gambar asli
      "title":
          "Twitter shareholders vote to approve Elon Musk’s bid to buy the company",
    },
    {
      "image":
          "https://images.unsplash.com/photo-1504711434969-e33886168f5c?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", // Ganti dengan gambar asli
      "title":
          "Twitter shareholders vote to approve Elon Musk’s bid to buy the company",
    },
    {
      "image":
          "https://images.unsplash.com/photo-1504711434969-e33886168f5c?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", // Ganti dengan gambar asli
      "title":
          "Twitter shareholders vote to approve Elon Musk’s bid to buy the company",
    },
    {
      "image":
          "https://images.unsplash.com/photo-1504711434969-e33886168f5c?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "title": "Kremlin says no decision to seal Russia’s borders amid chaos",
    },
    {
      "image":
          "https://images.unsplash.com/photo-1504711434969-e33886168f5c?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "title": "Japan honours Shinzo Abe with controversial state funeral",
    },
  ];

  final List<String> optionsdropdown = [
    'This Month',
    'Last Month',
    'This Week',
    'Last Week',
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: darkGreen,
        title: Row(
          children: [
            IconButton(
              icon: Image.asset('assets/icon_menu.png', scale: 5),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (BuildContext context) => Menu()),
                  (route) => true,
                );
              },
            ),
            Spacer(),
            Text(
              "WORLD NOW",
              style: boldTextStyle.copyWith(fontSize: 30, color: sageGreen),
            ),
            Spacer(),
            InkWell(
              onTap: () {
                log('Person Tapped !');
              },
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/icon_person.png'),
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/logo_small.png'),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Text(
                  'Saved Page',
                  style: semiBoldTextStyle.copyWith(fontSize: 20),
                ),
                SizedBox(width: 16),
                DropdownButton<String>(
                  focusColor: Colors.grey,
                  hint: Text('Pilih Waktu', style: semiBoldTextStyle),
                  value: selectedValue,
                  items:
                      optionsdropdown.map((String value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                  onChanged: (String? newvalue) {
                    setState(() {
                      selectedValue = newvalue;
                    });
                  },
                ),
              ],
            ),
            // News List
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 5),
                itemCount: news.length,
                itemBuilder: (context, index) {
                  return NewsCard(
                    imageUrl:
                        'https://images.unsplash.com/photo-1546422904-90eab23c3d7e?q=80&w=2944&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
