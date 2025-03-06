import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsify/static/custom/custom_button.dart';
import 'package:newsify/static/style/colors.dart';
import 'package:newsify/static/style/typography.dart';

class SomethingWrong extends StatelessWidget {
  const SomethingWrong({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/something_wrong.png',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Oops!',
                  style: boldTextStyle.copyWith(
                    fontSize: 26,
                    color: blackColor,
                  ),
                ),
                Text(
                  'Something went wrong,\n please try again later.',
                  style: regularTextStyle.copyWith(
                    fontSize: 18,
                    color: blackColor,
                  ),

                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                CustomButton(
                  text: 'Go Back !',
                  onPressed: () {
                    Get.back();
                  },
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
