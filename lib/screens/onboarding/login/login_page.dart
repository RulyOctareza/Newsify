import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsify/controller/auth_controller.dart';

import 'package:newsify/screens/onboarding/signup/signup_page.dart';

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
  final AuthController authController = Get.put(AuthController());

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
              // Logo app
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.teal.shade100,
                backgroundImage: AssetImage('assets/logo_small.png'),
              ),
              SizedBox(height: 20),

              // logo google
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
                  authController.login(
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
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
