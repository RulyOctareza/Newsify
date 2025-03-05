import 'package:flutter/material.dart';

import 'package:newsify/static/style/typography.dart';

class TextButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const TextButtonWidget({
    required this.onPressed,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: regularTextStyle.copyWith(
          fontSize: 20,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
