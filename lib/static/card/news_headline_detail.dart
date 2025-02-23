import 'package:flutter/material.dart';
import 'package:newsify/static/style/colors.dart';
import 'package:newsify/static/style/typography.dart';

class NewsHeadlineDetail extends StatelessWidget {
  const NewsHeadlineDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Bagian Teks
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: sageGreen, // Warna hijau muda mirip gambar
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Text(
                "Twitter shareholders vote to approve\nElon Musk’s bid to buy the company",
                textAlign: TextAlign.center,
                style: semiBoldTextStyle,
              ),
            ),
            // Gambar
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              child: Image.asset(
                'assets/image_onboarding2.jpg', // Ganti dengan path gambar yang sesuai
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: NewsHeadlineDetail()),
      ),
    ),
  );
}
