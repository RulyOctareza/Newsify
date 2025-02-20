import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:newsify/screens/onboarding/login/login_page.dart';
import 'package:newsify/static/custom/custom_button.dart';
import 'package:newsify/static/custom/custom_input_field.dart';
import 'package:newsify/static/custom/custom_password_field.dart';
import 'package:newsify/static/custom/custom_social_button.dart';
import 'package:newsify/static/style/colors.dart';
import 'package:newsify/static/style/typography.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isRemembered = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 53),
            // Logo
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.teal.shade100,
              backgroundImage: AssetImage('assets/logo_small.png'),
            ),
            SizedBox(height: 20),

            // Social Login Buttons
            Text("Continue with", style: boldTextStyle),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialButton(image: 'assets/icon_fb.png', label: "Facebook"),
                SizedBox(width: 10),
                SocialButton(image: 'assets/icon_google.png', label: "Google"),
              ],
            ),
            SizedBox(height: 20),

            Text(
              "or",
              style: regularTextStyle.copyWith(fontSize: 22, color: darkGreen),
            ),
            SizedBox(height: 10),
            Text(
              "Create Your Account",
              style: boldTextStyle.copyWith(fontSize: 22),
            ),
            SizedBox(height: 20),

            // Email Field
            CustomInputField(
              controller: emailController,
              label: "Email",
              hintText: "Enter your Email ID",
            ),

            // Password Field
            CustomPasswordField(
              controller: passwordController,
              hintText: 'password',
            ),

            // Remember Me Checkbox
            Row(
              children: [
                Checkbox(
                  value: isRemembered,
                  onChanged: (value) {
                    setState(() {
                      isRemembered = value!;
                    });
                  },
                ),
                Text("Remember Me"),
              ],
            ),

            // Sign Up Button
            CustomButton(
              text: 'Sign Up',
              type: ButtonType.primary,
              onPressed: () {
                log("Email: ${emailController.text}");
                log("Password: ${passwordController.text}");
              },
            ),

            // Login Link
            TextButton(
              onPressed: () {
                Get.to(() => LoginPage());
              },
              child: Text("Already have an account? Login"),
            ),
          ],
        ),
      ),
    );
  }
}
