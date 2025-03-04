import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:newsify/static/custom/custom_button.dart';
import 'package:newsify/static/style/colors.dart';
import 'package:newsify/static/style/typography.dart';

class OnboardingPageThree extends StatelessWidget {
  const OnboardingPageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/image_onboarding3.jpg',
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.transparent, Colors.black],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(),
                  Text(
                    'News according to your',
                    textAlign: TextAlign.center,
                    style: regularTextStyle.copyWith(
                      color: whiteColor,

                      fontSize: 40,
                    ),
                  ),
                  Text(
                    'Prefrence and Interest',
                    textAlign: TextAlign.center,
                    style: regularTextStyle.copyWith(
                      color: sageGreen,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 40,
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: green,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 40,
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: green,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 40,
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: green,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  CustomButton(
                    text: 'Start',
                    type: ButtonType.secondary,
                    onPressed: () {
                      Get.offAndToNamed('/login');
                    },
                  ),
                  SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
