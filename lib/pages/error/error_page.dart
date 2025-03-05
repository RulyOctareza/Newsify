import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsify/static/custom/custom_button.dart';
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

          Positioned(
            bottom: 250,
            left: 170,
            child: Text('Oops!', style: boldTextStyle.copyWith(fontSize: 26)),
          ),
          const Positioned(
            bottom: 170,
            left: 130,
            child: Text(
              'Something went wrong,\n please try again.',

              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            bottom: 100,
            left: 130,
            right: 130,
            child: CustomButton(
              text: 'Go Back !',
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ],
      ),
    );
  }
}
