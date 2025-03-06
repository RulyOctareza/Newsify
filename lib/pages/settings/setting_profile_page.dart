import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsify/controller/auth_controller.dart';
import 'package:newsify/controller/settings_profile_controller.dart';

import 'package:newsify/static/custom/custom_button.dart';
import 'package:newsify/static/custom/custom_appbar_news_header.dart';
import 'package:newsify/static/style/typography.dart';

class SettingProfilePage extends StatelessWidget {
  final AuthController authController = Get.find();
  final SettingsProfileController profileController = Get.find();
  final _auth = FirebaseAuth.instance;

  SettingProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewsHeader(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(() {
                return GestureDetector(
                  onTap: () async {
                    await profileController.changeProfilePhoto();
                  },
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage:
                        profileController.photoUrl.isNotEmpty
                            ? FileImage(File(profileController.photoUrl))
                                as ImageProvider
                            : _auth.currentUser?.photoURL != null
                            ? NetworkImage('${_auth.currentUser?.photoURL}')
                            : AssetImage('assets/logo_small.png')
                                as ImageProvider,
                  ),
                );
              }),
              SizedBox(height: 12),

              Obx(() {
                final String username =
                    profileController.username.isNotEmpty
                        ? profileController.username
                        : _auth.currentUser?.displayName ?? 'User';

                return Text(
                  username,
                  style: titleTextStyle.copyWith(fontSize: 24),
                );
              }),
              SizedBox(height: 5),

              Text(
                _auth.currentUser?.email ?? '',
                style: regularTextStyle.copyWith(fontSize: 22),
              ),
              SizedBox(height: 12),

              CustomButton(
                text: 'Change Username',
                onPressed: () async {
                  Future.delayed(Duration(milliseconds: 500), () {
                    profileController.changeProfilePhoto();
                    _showChangeUsernameDialog(context);
                  });
                },
              ),
              SizedBox(height: 12),

              CustomButton(
                text: 'Log out',
                onPressed: () {
                  _showAlertDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showChangeUsernameDialog(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Change Username'),
          content: TextField(
            controller: usernameController,
            decoration: InputDecoration(hintText: 'Enter new username'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (usernameController.text.isNotEmpty) {
                  profileController.changeUsername(usernameController.text);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                authController.logout();
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
