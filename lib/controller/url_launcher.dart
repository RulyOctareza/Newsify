import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  Future<void> _launchPlayStore() async {
    // Saya asumsikan ada App ID nya disini
    const String appId = 'com.example.newsify';
    final Uri playStoreUrl = Uri.parse(
      'https://play.google.com/store/apps/details?id=$appId',
    );

    if (await canLaunchUrl(playStoreUrl)) {
      await launchUrl(playStoreUrl);
    } else {
      throw 'Could not launch $playStoreUrl';
    }
  }

  void showRateUsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rate Us'),
          content: Text('Would you like to open the Store to rate our app?'),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                Get.back();

                _launchPlayStore();
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
