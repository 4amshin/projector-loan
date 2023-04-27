import 'package:projector_loan/core.dart';
import 'package:projector_loan/presentation/module/auth/admin_login/controller/admin_login_controller.dart';
import 'package:projector_loan/presentation/module/auth/admin_login/widget/admin_login_content.dart';

class AdminLoginView extends StatefulWidget {
  const AdminLoginView({Key? key}) : super(key: key);

  Widget build(context, AdminLoginController controller) {
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
            AdminLoginContent(),
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
  State<AdminLoginView> createState() => AdminLoginController();
}
