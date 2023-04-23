import 'package:flutter/material.dart';
import 'package:projector_loan/core.dart';

class EmailVerificationView extends StatefulWidget {
  const EmailVerificationView({Key? key}) : super(key: key);

  Widget build(context, EmailVerificationController controller) {
    controller.view = this;

    if (controller.isEmailVerified) {
      return const StMainNavigationView();
    } else {
      return const AtEmailVerify();
    }
  }

  @override
  State<EmailVerificationView> createState() => EmailVerificationController();
}
