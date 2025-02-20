import 'package:flutter/material.dart';
import 'package:newsify/static/style/colors.dart';
import 'package:newsify/static/style/typography.dart';

enum ButtonType { primary, secondary, optional }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonType type;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;

    switch (type) {
      case ButtonType.primary:
        backgroundColor = darkGreen;
        textColor = sageGreen;

        break;
      case ButtonType.secondary:
        backgroundColor = sageGreen;
        textColor = darkGreen;
        break;
      case ButtonType.optional:
        backgroundColor = Colors.grey;
        textColor = sageGreen;
        break;
    }

    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 44,
        width: 187,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: backgroundColor,
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: regularTextStyle.copyWith(color: textColor, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
