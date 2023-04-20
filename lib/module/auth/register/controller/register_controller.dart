import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projector_loan/core.dart';
import 'package:projector_loan/module/auth/email_verification/view/email_verification_view.dart';
import 'package:projector_loan/module/auth/login/view/login_view.dart';
import 'package:projector_loan/module/auth/register/view/register_view.dart';
import 'package:projector_loan/services/auth_services/auth_services.dart';
import 'package:projector_loan/state_util.dart';

class RegisterController extends State<RegisterView> implements MvcController {
  static late RegisterController instance;
  late RegisterView view;

  @override
  void initState() {
    instance = this;
    log("Register Page");
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  //textfield input variable
  String? fullName;
  String? nim;
  String? email;
  String? password;

  //function for register user
  doRegister() async {
    if (fullName?.isEmpty ?? true) {
      ShowSnackBar.show(context, message: "Masukkan nama lengkap anda");
      return;
    }

    if (nim?.isEmpty ?? true) {
      ShowSnackBar.show(context, message: "Masukkkan NIM anda");

      return;
    }

    if (nim!.length < 10) {
      ShowSnackBar.show(context, message: "Masukkan NIM yang lengkap");
    }

    if (email?.isEmpty ?? true) {
      ShowSnackBar.show(context, message: "Masukkan email yang benar");
      return;
    }

    if (password == null || password!.length < 6) {
      ShowSnackBar.show(context, message: "Kata sandi minimal 6 Karakter");
      return;
    }

    try {
      log("Register New User");
      await AuthService.createNewUser(
        email: email!,
        password: password!,
      );

      log("Save Student Data");
      await AuthService.addStudentData(
        email: email!,
        name: fullName!,
        nim: nim!,
      );

      Get.to(const EmailVerificationView());
    } catch (e) {
      ShowSnackBar.show(context, message: e.toString());
    }
  }

  toLoginView() {
    Get.offAll(const LoginView());
  }
}
