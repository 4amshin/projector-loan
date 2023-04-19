import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projector_loan/core.dart';

class LoginController extends State<LoginView> implements MvcController {
  static late LoginController instance;
  late LoginView view;

  @override
  void initState() {
    instance = this;
    log("Login Page");
    log("Current User = ${currentUser?.email}");
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  final currentUser = FirebaseAuth.instance.currentUser;

  //login textfield variable
  String? email;
  String? password;

  // execute login operation
  Future<void> doLogin() async {
    log("Email: $email");
    log("Password: $password");

    log("Try to Login....");

    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email!,
        password: password!,
      );

      if (userCredential.user?.emailVerified == true) {
        log("Navigate to Student Dashboard");
        Get.offAll(const StMainNavigationView());
      } else {
        showSnackbarMessage("Email belum diverifikasi");
        await userCredential.user?.sendEmailVerification();
        showSnackbarMessage("Mengirim Link Verifikasi");
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          showSnackbarMessage('Pengguna tidak ditemukan');
          break;
        case 'invalid-email':
          showSnackbarMessage('Email tidak terdaftar');
          break;
        case 'wrong-password':
          showSnackbarMessage("Password anda salah");
          break;
        default:
          log("Error during login: $e");
          showSnackbarMessage("Terjadi kesalahan saat login");
      }
    }
  }

  toRegisterView() {
    Get.offAll(const RegisterView());
  }

  forgetPasswordView() {
    log("Navigate to Forget Password Page");
    Get.to(const ForgotPasswordView());
  }

  void showSnackbarMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          message,
          style: GoogleFonts.openSans(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
