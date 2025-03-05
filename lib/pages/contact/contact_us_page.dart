import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:newsify/static/style/colors.dart';
import 'package:newsify/static/style/typography.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  void _copyToClipBoard(String text, BuildContext context) {
    Clipboard.setData(ClipboardData(text: text)).then((_) {
      Get.snackbar(
        'Congrats',
        'Copied to Clipboard',
        backgroundColor: green,
        colorText: darkGreen,
        duration: Duration(seconds: 2),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Us'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Gambar Profil
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/161659990?v=4',
              ),
            ),
            const SizedBox(height: 20),

            // Nama dan Tag
            const Text(
              'Fatchurizkia Ruly Octareza',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Flutter Developer',
              style: TextStyle(
                fontSize: 18,
                color: Colors.blueAccent,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),

            // Deskripsi Diri
            Text(
              "I am passionate about mobile application development and currently learning Dart, Flutter, and Fullstack Software Engineering.\n I am fluent in Indonesian, Korean (for work purposes), and English (both written and general conversation).",
              textAlign: TextAlign.center,
              style: regularTextStyle,
            ),
            const SizedBox(height: 30),

            // Informasi Kontak
            _buildContactInfo(
              icon: Icons.email,
              label: 'Email',
              value: 'rulyoctareza@gmail.com',
              onTap: () => _copyToClipBoard('rulyoctareza@gmail.com', context),
            ),
            const SizedBox(height: 15),
            _buildContactInfo(
              icon: Icons.link,
              label: 'LinkedIn',
              value: 'www.linkedin.com/in/rulyoctareza',
              onTap:
                  () => _copyToClipBoard(
                    'www.linkedin.com/in/rulyoctareza',
                    context,
                  ),
            ),
            const SizedBox(height: 15),
            _buildContactInfo(
              icon: Icons.code,
              label: 'GitHub',
              value: 'github.com/rulyoctareza',
              onTap: () => _copyToClipBoard('github.com/rulyoctareza', context),
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk menampilkan informasi kontak
  Widget _buildContactInfo({
    required IconData icon,
    required String label,
    required String value,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ListTile(
          trailing: Icon(Icons.copy),
          leading: Icon(icon, color: Colors.blueAccent),
          title: Text(label, style: boldTextStyle),
          subtitle: Text(value, style: regularTextStyle),
        ),
      ),
    );
  }
}
