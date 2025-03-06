import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newsify/controller/settings_profile_controller.dart';
import 'package:newsify/controller/theme_controller.dart';
import 'package:newsify/pages/settings/setting_profile_page.dart';
import 'package:newsify/static/style/colors.dart';
import 'package:newsify/static/style/typography.dart';

class NewsHeader extends StatelessWidget implements PreferredSizeWidget {
  NewsHeader({super.key});

  final _auth = FirebaseAuth.instance;
  final GetStorage _storage = GetStorage();
  final SettingsProfileController _settingsProfileController = Get.put(
    SettingsProfileController(),
  );

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
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
          Spacer(),
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

          IconButton(
            icon: Obx(() {
              return Icon(
                themeController.isDarkMode.value
                    ? Icons.light_mode
                    : Icons.dark_mode,
              );
            }),
            onPressed: () {
              themeController.toggleTheme();
            },
          ),

          Obx(() {
            return InkWell(
              onTap:
                  () => Get.to(
                    () => SettingProfilePage(),

                    arguments: {
                      'email': _auth.currentUser?.email ?? '',
                      'fullname':
                          _auth.currentUser?.displayName ??
                          _storage.read('username') ??
                          'user',
                      'photoURL':
                          _auth.currentUser?.photoURL ??
                          _storage.read('photoUrl') ??
                          '',
                    },
                  ),
              child: CircleAvatar(
                backgroundImage:
                    _settingsProfileController.photoUrl.isNotEmpty
                        ? FileImage(File(_settingsProfileController.photoUrl))
                            as ImageProvider
                        : _auth.currentUser?.photoURL != null
                        ? NetworkImage('${_auth.currentUser?.photoURL}')
                        : AssetImage('assets/logo_small.png') as ImageProvider,
              ),
            );
          }),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
