import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:newsify/static/custom/custom_button.dart';
import 'package:newsify/static/custom/newsheader.dart';
import 'package:newsify/static/style/typography.dart';

class SettingProfilePage extends StatefulWidget {
  const SettingProfilePage({super.key});

  @override
  State<SettingProfilePage> createState() => _SettingProfilePageState();
}

class _SettingProfilePageState extends State<SettingProfilePage> {
  File? _image;
  String? usernameController;
  String? fullnameController;
  String? emailController;
  String? phoneNumberController;

  // Future<void> _pickImage() async {
  //   final pickedFile = await ImagePicker().pickImage(
  //     source: ImageSource.gallery,
  //   );

  //   if (pickedFile != null) {
  //     setState(() {
  //       _image = File(pickedFile.path);
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();
    emailController = Get.arguments["email"] ?? "";
    fullnameController = Get.arguments["fullname"] ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: NewsHeader(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Foto Profil
              CircleAvatar(
                radius: 50,
                backgroundImage:
                    _image == null
                        ? NetworkImage(
                          '${FirebaseAuth.instance.currentUser?.photoURL}',
                        )
                        : FileImage(_image!) as ImageProvider,
                backgroundColor: Colors.grey[300],
              ),

              SizedBox(height: 12),
              Text(
                '${FirebaseAuth.instance.currentUser?.displayName}',
                style: titleTextStyle.copyWith(fontSize: 24),
              ),
              SizedBox(height: 5),
              Text(
                '${FirebaseAuth.instance.currentUser?.email}',
                style: regularTextStyle.copyWith(fontSize: 22),
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
}

void _showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Alert'),
        content: Text('Are you sure log Out ?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('No'),
          ),
          TextButton(
            onPressed: () {
              Get.offAndToNamed('/login');
            },
            child: Text('Yes'),
          ),
        ],
      );
    },
  );
}
