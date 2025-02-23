import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsify/screens/detail/detail_page_news.dart';

import 'package:newsify/screens/onboarding/loading/loading_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoadingPage(),
    );
  }
}
