import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsify/static/style/colors.dart';
import 'package:newsify/static/style/typography.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});
  get user => FirebaseAuth.instance.currentUser;
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: green),
            accountName: Text(
              user?.displayName ?? 'Guest',
              style: semiBoldTextStyle.copyWith(fontSize: 20, color: darkGreen),
            ),
            accountEmail: Text(
              user?.email ?? '',
              style: regularTextStyle.copyWith(fontSize: 14, color: darkGreen),
            ),
            currentAccountPicture: CircleAvatar(
              foregroundImage:
                  user?.photoURL != null ? NetworkImage(user!.photoURL!) : null,
              child:
                  user?.photoURL == null ? Icon(Icons.person, size: 40) : null,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: darkGreen),
            title: Text('Home', style: regularTextStyle),
            onTap: () => Get.toNamed('/homepage'),
          ),
          ListTile(
            leading: Icon(Icons.bookmark, color: darkGreen),
            title: Text('Saved', style: regularTextStyle),
            onTap: () => Get.toNamed('/saved'),
          ),
          ListTile(
            leading: Icon(Icons.settings, color: darkGreen),
            title: Text('Settings', style: regularTextStyle),
            onTap:
                () => Get.toNamed(
                  '/setting',
                  arguments: {
                    'email': user?.email,
                    'fullname': user?.displayName,
                    'photoURL': user?.photoURL,
                  },
                ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info, color: darkGreen),
            title: Text('About Us', style: regularTextStyle),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.contact_mail, color: darkGreen),
            title: Text('Contact Us', style: regularTextStyle),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.star, color: darkGreen),
            title: Text('Rate us on Play Store', style: regularTextStyle),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.feedback, color: darkGreen),
            title: Text('Write a Feedback', style: regularTextStyle),
            onTap: () {},
          ),
          Spacer(),
          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text(
              'Logout',
              style: regularTextStyle.copyWith(color: Colors.red),
            ),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Get.offAllNamed('/login');
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
