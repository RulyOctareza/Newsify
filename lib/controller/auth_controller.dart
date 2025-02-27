import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsify/services/auth_service.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();

  final Rx<UserCredential?> userCredential = Rx<UserCredential?>(null);

  Future<void> signIn() async {
    try {
      UserCredential? credential = await _authService.signIn();
      if (credential != null) {
        userCredential.value = credential;
        Get.offAndToNamed('/homepage');
      } else {
        Get.snackbar("Login sukses", "Congrats");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> login({required String email, required String password}) async {
    try {
      String? errorMessage = await _authService.login(email, password);
      if (errorMessage == null) {
        Get.snackbar(
          "Congrats",
          "Login Success",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.toNamed('/homepage');
      } else {
        Get.snackbar(
          "Error",
          errorMessage,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Future<User?> register(String email, String password) async {
    try {
      String? errorMessage = await _authService.registerWithEmail(
        email,
        password,
      );
      if (errorMessage == null) {
        Get.snackbar(
          "Registrasi Sukses",
          "Silakan login",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.toNamed('/login');
      } else {
        Get.snackbar(
          "Error",
          errorMessage,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
