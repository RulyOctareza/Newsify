import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsify/services/google_sign_in.dart';
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
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  bool isRemembered = false;

  ValueNotifier<UserCredential?> userCredential = ValueNotifier(null);

  void _signIn() async {
    UserCredential? credential = await signInWithGoogle();
    userCredential.value = credential;
    log(credential?.user?.email ?? "No email found");

    // Navigasi setelah login berhasil
    if (mounted) {
      Get.offAndToNamed('/homepage');
    }
  }

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Registrasi Sukses')));

      Get.toNamed('/login');
    } on FirebaseAuthException catch (e) {
      String message = "Terjadi kesalahan";
      if (e.code == 'email-already-in-use') {
        message = "Email sudah digunakan";
      } else if (e.code == 'invalid-email') {
        message = "Format email tidak valid";
      } else if (e.code == 'weak-password') {
        message = "Password terlalu lemah";
      }
      log(e.toString());
      Get.snackbar('Error', message);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
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
                "Create Your Account",
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
                hintText: 'Input your password',
              ),
              CustomPasswordField(
                label: 'Password',
                controller: _confirmPassword,
                hintText: 'Confirm your password',
              ),
              SizedBox(height: 12),

              // Remember Me Checkbox
              // Row(
              //   children: [
              //     Checkbox(
              //       value: isRemembered,
              //       onChanged: (value) {
              //         setState(() {
              //           isRemembered = value!;
              //         });
              //       },
              //     ),
              //     Text("Remember Me"),
              //   ],
              // ),

              // Sign Up Button
              CustomButton(
                text: 'Sign Up',
                type: ButtonType.primary,
                onPressed: () {
                  if (_passwordController.text == _confirmPassword.text) {
                    _register();
                  }
                },
              ),

              // Login Link
              TextButton(
                onPressed: () {
                  Get.toNamed('/login');
                },
                child: Text("Already have an account? Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
