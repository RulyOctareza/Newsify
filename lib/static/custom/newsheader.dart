import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsify/screens/settings/setting_profile_page.dart';

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
              Get.toNamed('/menu');
            },
          ),
          Spacer(),
          TextButton(
            onPressed: () {
              Get.offAndToNamed('/homepage');
            },
            child: Text(
              "WORLD NOW",
              style: boldTextStyle.copyWith(fontSize: 30, color: sageGreen),
            ),
          ),
          Spacer(),
          InkWell(
            onTap:
                () => Get.to(
                  () => SettingProfilePage(),

                  arguments: {
                    'email': FirebaseAuth.instance.currentUser?.email,
                    'fullname': FirebaseAuth.instance.currentUser?.displayName,
                    'photoURL': FirebaseAuth.instance.currentUser?.photoURL,
                  },
                ),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                '${FirebaseAuth.instance.currentUser?.photoURL}',
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
