import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:projector_loan/core.dart';

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
        context,
        email: email!,
        password: password!,
      );

      log("Save Student Data");
      await StudentData.addStudentData(
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
