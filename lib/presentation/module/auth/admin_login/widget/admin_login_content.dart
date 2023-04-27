import 'package:projector_loan/core.dart';
import 'package:projector_loan/presentation/module/auth/admin_login/controller/admin_login_controller.dart';

class AdminLoginContent extends StatelessWidget {
  const AdminLoginContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AdminLoginController controller = AdminLoginController.instance;
    return Column(
      children: [
        const AtTitle(
          title: 'Admin Login',
          content: 'Silahkan masukkan akun anda',
        ),
        const SizedBox(height: 35),
        AtTextField(
          iconUrl: 'person-outline.svg',
          hint: 'Username',
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
        const SizedBox(height: 15),
        AtRegistrationButton(
          title: 'LOGIN',
          onTap: () => controller.doAdminLogin(),
        ),
      ],
    );
  }
}
