import 'package:flutter/material.dart';
import 'package:projector_loan/module/auth/login/controller/login_controller.dart';
import 'package:projector_loan/module/auth/login/widget/at_login_content.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;

    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 15,
        ),
        child: Column(
          children: const [
            Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            AtLoginContent(),
            Expanded(
              flex: 1,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<LoginView> createState() => LoginController();
}
