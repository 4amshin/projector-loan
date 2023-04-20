import 'package:flutter/material.dart';
import 'package:projector_loan/module/auth/login/controller/login_controller.dart';
import 'package:projector_loan/module/auth/register/widget/at_account_confirmation.dart';
import 'package:projector_loan/module/auth/register/widget/at_registration_button.dart';
import 'package:projector_loan/module/auth/register/widget/at_text_field.dart';
import 'package:projector_loan/module/auth/register/widget/at_title.dart';
import 'package:projector_loan/shared/util/validator/validator.dart';

class AtLoginContent extends StatelessWidget {
  const AtLoginContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController controller = LoginController.instance;
    return Column(
      children: [
        const AtTitle(
          title: 'Selamat Datang',
          content: 'Silahkan masukkan akun anda',
        ),
        const SizedBox(height: 35),
        AtTextField(
          iconUrl: 'sms.svg',
          hint: 'Email',
          validator: Validator.required,
          autofillHints: const [AutofillHints.email],
          onChanged: (value) {
            controller.email = value;
          },
        ),
        AtTextField(
          iconUrl: 'key.svg',
          hint: 'Password',
          validator: Validator.required,
          obscure: true,
          showPasswordIcon: true,
          onChanged: (value) {
            controller.password = value;
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AtAccountConfirmation(
              content: '',
              link: "Lupa Password?",
              onTap: () => controller.forgetPasswordView(),
            ),
          ],
        ),
        const SizedBox(height: 15),
        AtRegistrationButton(
          title: 'LOGIN',
          onTap: () => controller.doLoginWithEmail(),
        ),
        const SizedBox(height: 20),
        AtAccountConfirmation(
          content: 'Tidak punya akun? ',
          link: 'Daftar disini',
          onTap: () => controller.toRegisterView(),
        ),
      ],
    );
  }
}
