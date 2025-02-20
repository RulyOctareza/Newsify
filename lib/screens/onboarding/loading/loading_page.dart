import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsify/screens/onboarding/onboarding_page_one.dart';
import 'package:newsify/static/style/colors.dart';
import 'package:newsify/static/style/typography.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Get.off(() => const OnboardingPageOne());
    });

    return Scaffold(
      backgroundColor: darkGreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 280,
              width: 280,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo_big.png'),
                ),
              ),
            ),
            SizedBox(height: 35),
            Text(
              'WORLD NEWS',
              style: titleTextStyle.copyWith(color: sageGreen, fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
