import 'dart:developer';

import 'package:projector_loan/core.dart';

class AuthService {
  static Future<bool> createNewUser(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    try {
      //create user
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //send email verification
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      ShowSnackBar.show(context, message: "Mengirim Link Verifikasi");
      log('Email verification sent to ${FirebaseAuth.instance.currentUser!.email}');
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ShowSnackBar.show(context, message: "Kombinasi passoword lemah");
      } else if (e.code == 'email-already-in-use') {
        ShowSnackBar.show(context,
            message: "Akun sudah ada untuk email tersebut");
      }
      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  static Future<void> signInWithEmail(
    BuildContext context, {
    required bool isAdmin,
    required String email,
    required String password,
  }) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      //admin doesn't need email verified
      if (isAdmin) {
        log("Navigate to Admin Dashboard");
        Get.offAll(const AdmMainNavigationView());
      }

      //while other than admin need email verified
      if (!isAdmin) {
        if (userCredential.user != null &&
            userCredential.user!.emailVerified == true) {
          log("Navigate to Student Dashboard");
          Get.offAll(const StMainNavigationView());
        } else {
          ShowSnackBar.show(context, message: "Email belum diverifikasi");
          if (userCredential.user != null) {
            await userCredential.user?.sendEmailVerification();
            log("Sending Email Verification");
          }
          ShowSnackBar.show(context, message: "Mengirim Link Verifikasi");
        }
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          ShowSnackBar.show(context, message: "Pengguna tidak ditemukan");

          break;
        case 'invalid-email':
          ShowSnackBar.show(context, message: "Email tidak terdaftar");

          break;
        case 'wrong-password':
          ShowSnackBar.show(context, message: "Password anda salah");

          break;
        default:
          log("Error during login: $e");
          ShowSnackBar.show(context, message: "Terjadi kesalahan saat login");
      }
    }
  }
}
