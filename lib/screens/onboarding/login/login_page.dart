import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:newsify/screens/onboarding/signup/signup_page.dart';
import 'package:newsify/services/google_sign_in.dart';

import 'package:newsify/static/custom/custom_button.dart';
import 'package:newsify/static/custom/custom_input_field.dart';
import 'package:newsify/static/custom/custom_password_field.dart';
import 'package:newsify/static/custom/custom_social_button.dart';
import 'package:newsify/static/style/colors.dart';
import 'package:newsify/static/style/typography.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isRemembered = false;

  ValueNotifier<UserCredential?> userCredential = ValueNotifier(null);

  void _signIn() async {
    try {
      UserCredential? credential = await signInWithGoogle();
      if (credential != null) {
        userCredential.value = credential;
        log("User signed in: ${credential.user?.email ?? 'No email found'}");

        // Navigasi setelah login berhasil
        if (mounted) {
          Get.offAndToNamed('/homepage');
        }
      } else {
        log("Google sign-in failed or canceled.");
      }
    } catch (e) {
      log("Error during sign-in: $e");
      Get.snackbar('Login Error', 'Gagal masuk dengan Google.');
    }
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      Get.snackbar(
        'Congratulations',
        'Login Success',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      Get.toNamed('/homepage');
    } on FirebaseAuthException catch (e) {
      String message = "Terjadi kesalahan";
      if (e.code == 'invalid-credential') {
        message = "Email or Password wrong";
      } else if (e.code == 'invalid-email') {
        message = "Format email tidak valid";
      } else if (e.code == 'weak-password') {
        message = "Password terlalu lemah";
      }
      log(e.toString());
      Get.snackbar(
        'Error',
        message,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
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
                  ValueListenableBuilder(
                    valueListenable: userCredential,
                    builder: (context, value, child) {
                      return SocialButton(
                        onPressed: _signIn,
                        image: 'assets/icon_google.png',
                        label: "Google",
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 20),

              Text(
                "or",
                style: regularTextStyle.copyWith(
                  fontSize: 22,
                  color: darkGreen,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Login with Your Account",
                style: boldTextStyle.copyWith(fontSize: 22),
              ),
              SizedBox(height: 20),

              // Email Field
              CustomInputField(
                controller: _emailController,
                label: "Email",
                hintText: "Enter your Email ID",
              ),

              // Password Field
              CustomPasswordField(
                label: 'Password',
                controller: _passwordController,
                hintText: 'Input Your Password',
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
                text: 'Login',
                type: ButtonType.primary,
                onPressed: () {
                  _login();
                },
              ),

              // Login Link
              TextButton(
                onPressed: () {
                  Get.to(() => SignUpPage());
                },
                child: Text("Don’t have an account? Sign up"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
