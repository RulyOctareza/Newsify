import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsify/pages/menu/menu_widget.dart';
import 'package:newsify/static/custom/text_button_widget.dart';
import 'package:newsify/static/style/colors.dart';
import 'package:newsify/static/style/typography.dart';

class Menu extends StatelessWidget {
  final String? name;

  Menu({super.key, this.name});
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 25,
            bottom: 35,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: IconButton(
                      icon: Icon(Icons.close_rounded, size: 24),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Spacer(),
                  Flexible(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey[300],
                      backgroundImage:
                          _auth.currentUser?.photoURL != null
                              ? NetworkImage(_auth.currentUser!.photoURL!)
                              : AssetImage('assets/logo_small.png')
                                  as ImageProvider,
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    _auth.currentUser?.displayName != null
                        ? '${_auth.currentUser?.displayName}'
                        : '${_auth.currentUser?.email}',
                    style: semiBoldTextStyle.copyWith(
                      fontSize: 22,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 35),
              MenuWidget(
                title: 'Home',
                color: darkGreen,
                ontap: () {
                  Get.toNamed('/homepage');
                },
              ),
              MenuWidget(
                ontap: () {
                  Get.toNamed('/saved');
                },
                title: 'Saved',
                color: darkGreen,
              ),
              MenuWidget(
                ontap: () {
                  Get.toNamed(
                    '/setting',
                    arguments: {
                      'email': FirebaseAuth.instance.currentUser?.email,
                      'fullname':
                          FirebaseAuth.instance.currentUser?.displayName,
                      'photoURL': FirebaseAuth.instance.currentUser?.photoURL,
                    },
                  );
                },
                title: 'Settings',
                color: darkGreen,
              ),
              Spacer(),

              TextButtonWidget(
                onPressed: () {
                  Get.toNamed('/setting');
                },
                title: 'About Us',
              ),
              TextButtonWidget(onPressed: () {}, title: 'Contact Us'),
              TextButtonWidget(
                onPressed: () {},
                title: 'Rate us on Play Store',
              ),
              TextButtonWidget(onPressed: () {}, title: 'Write a Feedback'),
            ],
          ),
        ),
      ),
    );
  }
}
