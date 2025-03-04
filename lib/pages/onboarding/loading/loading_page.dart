import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:newsify/controller/auth_controller.dart';
import 'package:newsify/static/style/colors.dart';
import 'package:newsify/static/style/typography.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  late final AuthController _authController;

  @override
  void initState() {
    super.initState();
    _checkUserStatus();
    Future.microtask(() {
      _authController = Get.find<AuthController>();
    });
  }

  Future<void> _checkUserStatus() async {
    await Future.delayed(Duration(seconds: 2));

    if (_authController.currentUser.value == null) {
      Get.offAllNamed('/onboarding1');
    } else {
      Get.offAllNamed('/homepage');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo_small.png', height: 120),
            SizedBox(height: 20),
            Text(
              'WORLD NEWS',
              style: boldTextStyle.copyWith(fontSize: 24, color: sageGreen),
            ),
            SizedBox(height: 20),
            Lottie.asset(
              'assets/loading_animation.json',
              width: 150,
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}
