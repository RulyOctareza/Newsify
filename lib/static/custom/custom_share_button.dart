import 'package:flutter/material.dart';
import 'package:newsify/static/style/colors.dart';
import 'package:newsify/static/style/typography.dart';

class ShareButton extends StatelessWidget {
  final String icon;
  final String label;

  const ShareButton({required this.icon, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(icon)),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(label, style: regularTextStyle.copyWith(color: sageGreen)),
      ],
    );
  }
}
