import 'package:flutter/material.dart';
import 'package:projector_loan/core.dart';
import '../controller/email_verification_controller.dart';

class EmailVerificationView extends StatefulWidget {
  const EmailVerificationView({Key? key}) : super(key: key);

  Widget build(context, EmailVerificationController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("EmailVerification"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<EmailVerificationView> createState() => EmailVerificationController();
}