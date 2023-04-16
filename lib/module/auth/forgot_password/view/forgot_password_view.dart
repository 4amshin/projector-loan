import 'package:flutter/material.dart';
import 'package:projector_loan/core.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  Widget build(context, ForgotPasswordController controller) {
    controller.view = this;

    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          minimum: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            children: [
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Center(
                child: Column(
                  children: [
                    const AtTitle(
                      title: 'Lupa Password Akun?',
                      content:
                          'Masukkan alamat email anda, untuk proses reset password',
                    ),
                    const SizedBox(height: 20),
                    AtTextField(
                      iconUrl: 'sms.svg',
                      hint: 'Email',
                      validator: Validator.required,
                      autofillHints: const [AutofillHints.email],
                      onChanged: (value) {
                        controller.email = value;
                      },
                    ),
                    AtRegistrationButton(
                      title: 'Submit',
                      onTap: () => controller.doResetPassword(),
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 1,
                child: SizedBox(),
              ),
            ],
          ),
        ));
  }

  @override
  State<ForgotPasswordView> createState() => ForgotPasswordController();
}
