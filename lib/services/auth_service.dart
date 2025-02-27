import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final _auth = FirebaseAuth.instance;

class AuthService {
  ValueNotifier<UserCredential?> userCredential = ValueNotifier(null);

  Future<String?> login(
    String emailController,
    String passwordController,
  ) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.trim(),
        password: passwordController.trim(),
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        return "Email atau Password salah";
      } else if (e.code == 'invalid-email') {
        return "Format email tidak valid";
      }
      return "Terjadi kesalahan";
    }
  }

  Future<UserCredential?> signIn() async {
    try {
      UserCredential? credential = await signInWithGoogle();
      userCredential.value = credential;
      log(credential?.user?.email ?? "No email found");
    } on Exception catch (e) {
      log("Login error: $e");
      return null;
    }
    return null;
  }

  Future<String?> registerWithEmail(
    String emailController,
    String passwordController,
  ) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: emailController.trim(),
        password: passwordController.trim(),
      );

      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return "Email sudah digunakan";
      } else if (e.code == 'invalid-email') {
        return "Format email tidak valid";
      } else if (e.code == 'weak-password') {
        return "Password terlalu lemah";
      }
      return "Terjadi kesalahan";
    }
  }

  Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      log('exception->$e');
    }
  }

  Future<bool> signOutFromGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}
