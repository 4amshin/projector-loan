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
  doLoginWithEmail() {
    AuthService.signInWithEmail(
      context,
      email!,
      password!,
    );
  }

  toRegisterView() {
    Get.offAll(const RegisterView());
  }

  forgetPasswordView() {
    log("Navigate to Forget Password Page");
    Get.to(const ForgotPasswordView());
  }
}
