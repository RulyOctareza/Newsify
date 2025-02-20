import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsify/screens/onboarding/onboarding_page_three.dart';
import 'package:newsify/screens/onboarding/onboarding_page_two.dart';
import 'package:newsify/static/custom/custom_button.dart';
import 'package:newsify/static/style/colors.dart';
import 'package:newsify/static/style/typography.dart';

class OnboardingPageOne extends StatelessWidget {
  const OnboardingPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/image_onboarding1.jpg',
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
                          color: sageGreen,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 40,
                        height: 8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: sageGreen,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  CustomButton(
                    text: 'Continue',
                    type: ButtonType.secondary,
                    onPressed: () {
                      Get.to(() => const OnboardingPageTwo());
                    },
                  ),
                  SizedBox(height: 12),
                  InkWell(
                    onTap: () => Get.to(() => OnboardingPageThree()),
                    child: Text(
                      'Skip',
                      style: semiBoldTextStyle.copyWith(color: whiteColor),
                    ),
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
