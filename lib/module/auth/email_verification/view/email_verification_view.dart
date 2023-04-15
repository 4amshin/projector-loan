import 'package:flutter/material.dart';
import 'package:projector_loan/module/auth/email_verification/controller/email_verification_controller.dart';
import 'package:projector_loan/module/auth/email_verification/widget/at_email_verify.dart';
import 'package:projector_loan/module/student/st_main_navigation/view/st_main_navigation_view.dart';

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
