import 'package:flutter/material.dart';
import 'package:projector_loan/module/auth/register/controller/register_controller.dart';
import 'package:projector_loan/module/auth/register/widget/at_register_content.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  Widget build(context, RegisterController controller) {
    controller.view = this;

    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 15,
        ),
        child: ListView(
          children: const [
            SizedBox(
              height: 140,
            ),
            AtRegisterContent(),
          ],
        ),
      ),
    );
  }

  @override
  State<RegisterView> createState() => RegisterController();
}
