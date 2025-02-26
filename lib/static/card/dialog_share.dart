import 'package:flutter/material.dart';
import 'package:newsify/static/custom/custom_share_button.dart';
import 'package:newsify/static/style/colors.dart';

void showShareDialog(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    backgroundColor: darkGreen,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 16.0,
          runSpacing: 16.0,
          children: [
            ShareButton(icon: 'assets/icon_email.png', label: "Email"),
            ShareButton(icon: 'assets/icon_fb.png', label: "Facebook"),
            ShareButton(icon: 'assets/icon_google.png', label: "Google"),
            ShareButton(icon: 'assets/icon_instagram.png', label: "Instagram"),
            ShareButton(icon: 'assets/icon_reddit.png', label: "Reddit"),
            ShareButton(icon: 'assets/icon_telegram.png', label: "Telegram"),
            ShareButton(icon: 'assets/icon_twitter.png', label: "Twitter"),
            ShareButton(icon: 'assets/icon_whatsapp.png', label: "Whatsapp"),
          ],
        ),
      );
    },
  );
}
