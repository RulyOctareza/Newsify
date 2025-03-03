import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _auth = FirebaseAuth.instance;

class AuthService {
  final Rx<User?> user = Rx<User?>(null);

  Future<User?> checkCurrentUser() async {
    User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      user.value = currentUser;
    }
    return currentUser;
  }

  Future<String?> login(
    String emailController,
    String passwordController,
  ) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: emailController.trim(),
        password: passwordController.trim(),
      );

      if (credential.user != null) {
        await saveUserToPrefs(credential.user!.uid);
        user.value = credential.user;
      }

      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        return "Email atau Password salah";
      } else if (e.code == 'invalid-email') {
        return "Format email tidak valid";
      }
      return "Terjadi kesalahan: ${e.message}";
    }
  }

  Future<UserCredential?> signIn() async {
    try {
      UserCredential? credential = await signInWithGoogle();
      if (credential != null && credential.user != null) {
        user.value = credential.user;
      }
      return credential;
    } on Exception catch (e) {
      log("Login error: $e");
      return null;
    }
  }

  Future<String?> registerWithEmail(
    String emailController,
    String passwordController,
  ) async {
    try {
      UserCredential _ = await _auth.createUserWithEmailAndPassword(
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
      return "Terjadi kesalahan: ${e.message}";
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);

      if (userCredential.user != null) {
        await saveUserToPrefs(userCredential.user!.uid);
      }

      return userCredential;
    } catch (e) {
      log('exception->$e');
      return null;
    }
  }

  Future<bool> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      await removeUserFromPrefs();
      user.value = null;
      return true;
    } on Exception catch (e) {
      log('Logout error: $e');
      return false;
    }
  }

  Future<void> saveUserToPrefs(String uid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('uid', uid);
  }

  Future<String?> getUserFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('uid');
  }

  Future<void> removeUserFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('uid');
  }
}
