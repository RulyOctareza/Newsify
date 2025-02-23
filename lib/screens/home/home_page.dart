import 'package:flutter/material.dart';
import 'package:newsify/static/card/news_card.dart';
import 'package:newsify/static/custom/custom_newsheader.dart';
import 'package:newsify/static/style/colors.dart';
import 'package:newsify/static/style/typography.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<HomePage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      //News Header
      //
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
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            //

            // Categories

            //
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                    categories.map((category) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Chip(
                          label: Text(category),
                          backgroundColor:
                              category == "Trending" ? green : Colors.grey,
                        ),
                      );
                    }).toList(),
              ),
            ),
            SizedBox(height: 10),
            //
            // News List
            //
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
