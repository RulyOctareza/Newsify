import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsify/controller/auth_controller.dart';

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
  final AuthController authController = Get.put(AuthController());

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
                        onPressed: authController.signIn,
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

              // Sign Up Button
              CustomButton(
                text: 'Sign Up',
                type: ButtonType.primary,
                onPressed: () {
                  if (!_formKey.currentState!.validate()) return;
                  if (_passwordController.text == _confirmPassword.text) {
                    authController.register(
                      _emailController.text,
                      _passwordController.text,
                    );
                  } else {
                    Get.snackbar(
                      'Error',
                      'Password tidak sama',
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
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
