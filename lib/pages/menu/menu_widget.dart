import 'package:flutter/material.dart';
import 'package:newsify/static/style/colors.dart';
import 'package:newsify/static/style/typography.dart';

class MenuWidget extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback ontap;

  const MenuWidget({required this.title, required this.color, super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(bottom: 12),
        height: 50,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 9),
          child: Text(
            title,
            style: regularTextStyle.copyWith(fontSize: 20, color: sageGreen),
          ),
        ),
      ),
    );
  }
}
