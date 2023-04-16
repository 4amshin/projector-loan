import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projector_loan/core.dart';
import 'package:projector_loan/state_util.dart';
import '../view/forgot_password_view.dart';

class ForgotPasswordController extends State<ForgotPasswordView>
    implements MvcController {
  static late ForgotPasswordController instance;
  late ForgotPasswordView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String? email;

  doResetPassword() async {
    try {
      if (email != null) {
        log("Sending Reset Password Link");
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: email!.trim());
        showInfoDialog("Link reset password telah terkirim ke email anda!");
      }
      log("Back to Login Page");
      Get.offAll(const LoginView());
    } on FirebaseException catch (err) {
      log(err.toString());
    }
  }
}
