import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsify/screens/settings/setting_profile_page.dart';

import 'package:newsify/static/style/colors.dart';
import 'package:newsify/static/style/typography.dart';

class NewsHeader extends StatelessWidget implements PreferredSizeWidget {
  NewsHeader({super.key});

  final _auth = FirebaseAuth.instance;

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
                    'email': _auth.currentUser?.email,
                    'fullname': _auth.currentUser?.displayName,
                    'photoURL': _auth.currentUser?.photoURL,
                  },
                ),
            child: CircleAvatar(
              backgroundImage:
                  _auth.currentUser?.photoURL != null
                      ? NetworkImage('${_auth.currentUser?.photoURL}')
                      : AssetImage('assets/logo_small.png'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
