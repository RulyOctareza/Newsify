import 'package:flutter/material.dart';
import 'package:newsify/static/style/typography.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hintText;
  final bool isPassword;
  final IconData? icon;

  const CustomInputField({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.isPassword = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            text: label,
            style: boldTextStyle,
            children: [
              TextSpan(
                text: " *",
                style: boldTextStyle.copyWith(color: Colors.red),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hintText,
            // prefixIcon: icon != null ? Icon(icon, color: Colors.grey) : null,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            suffixIcon: icon != null ? Icon(icon, color: Colors.grey) : null,
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
