import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:newsify/screens/menu/menu.dart';
import 'package:newsify/static/style/colors.dart';
import 'package:newsify/static/style/typography.dart';

class NewsHeader extends StatelessWidget implements PreferredSizeWidget {
  const NewsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: darkGreen,
      title: Row(
        children: [
          IconButton(
            icon: Image.asset('assets/icon_menu.png', scale: 5),
            onPressed: () {
              Get.to(() => Menu());
            },
          ),
          Spacer(),
          Text(
            "WORLD NOW",
            style: boldTextStyle.copyWith(fontSize: 30, color: sageGreen),
          ),
          Spacer(),
          CircleAvatar(backgroundImage: AssetImage('assets/icon_person.png')),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
