// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final String image;
  final String label;
  final VoidCallback onPressed;

  const SocialButton({
    super.key,
    required this.image,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 2,
      ),
      icon: Image.asset(image, width: 24, height: 24),
      label: Text(label),
      onPressed: onPressed,
    );
  }
}
