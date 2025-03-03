import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:newsify/services/auth_service.dart';
import 'package:newsify/static/style/colors.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final Rx<User?> currentUser = Rx<User?>(null);

  @override
  void onInit() {
    super.onInit();
    checkUserLoggedIn();
  }

  Future<void> checkUserLoggedIn() async {
    String? uid = await _authService.getUserFromPrefs();
    if (uid != null) {
      try {
        User? user = _auth.currentUser;

        if (user == null) {
          await _auth.authStateChanges().first;
          user = _auth.currentUser;
        }

        if (user != null && user.uid == uid) {
          currentUser.value = user;

          Get.offAllNamed('/homepage');
        } else {
          await _authService.removeUserFromPrefs();
        }
      } catch (e) {
        await _authService.removeUserFromPrefs();
      }
    }
  }

  Future<void> logout() async {
    try {
      bool success = await _authService.signOut();
      if (success) {
        currentUser.value = null;
        Get.offAllNamed('/login');
      } else {
        Get.snackbar(
          "Error",
          "Gagal logout",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Gagal logout: ${e.toString()}",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<User?> signIn() async {
    try {
      UserCredential? credential = await _authService.signIn();
      if (credential != null && credential.user != null) {
        currentUser.value = credential.user;
        Get.snackbar(
          "Login sukses",
          "Selamat datang ${credential.user!.displayName ?? ''}",
          backgroundColor: green,
          colorText: Colors.white,
        );
        Get.offAllNamed('/homepage');
        return credential.user;
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Gagal login: ${e.toString()}",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
    return null;
  }

  Future<User?> login({required String email, required String password}) async {
    try {
      String? errorMessage = await _authService.login(email, password);
      if (errorMessage == null) {
        User? user = _auth.currentUser;
        if (user != null) {
          currentUser.value = user;
          Get.snackbar(
            "Berhasil",
            "Login Sukses",
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          Get.offAllNamed('/homepage');
          return user;
        }
      } else {
        Get.snackbar(
          "Error",
          errorMessage,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Gagal login: ${e.toString()}",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
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
      Get.snackbar(
        "Error",
        "Gagal registrasi: ${e.toString()}",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
    return null;
  }

  User? getCurrentUser() {
    return currentUser.value;
  }
}
