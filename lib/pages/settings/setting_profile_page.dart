import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsify/controller/auth_controller.dart';
import 'package:newsify/static/custom/custom_button.dart';
import 'package:newsify/static/custom/custom_appbar_news_header.dart';
import 'package:newsify/static/style/typography.dart';

class SettingProfilePage extends StatefulWidget {
  const SettingProfilePage({super.key});

  @override
  State<SettingProfilePage> createState() => _SettingProfilePageState();
}

class _SettingProfilePageState extends State<SettingProfilePage> {
  String? usernameController;
  String? fullnameController;
  String? emailController;
  String? phoneNumberController;

  final _auth = FirebaseAuth.instance;
  late final AuthController authController;
  @override
  void initState() {
    super.initState();
    emailController = Get.arguments?["email"] ?? "";
    fullnameController = Get.arguments?["fullname"] ?? "";

    authController = Get.find<AuthController>();
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
              
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                backgroundImage:
                    _auth.currentUser?.photoURL != null
                        ? NetworkImage(_auth.currentUser!.photoURL!)
                        : AssetImage('assets/logo_small.png') as ImageProvider,
              ),

              SizedBox(height: 12),
              Text(
                _auth.currentUser?.displayName ?? 'User',
                style: titleTextStyle.copyWith(fontSize: 24),
              ),
              SizedBox(height: 5),
              Text(
                _auth.currentUser?.email ?? 'No email',
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
