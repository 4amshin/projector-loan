import 'package:projector_loan/core.dart';

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
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                onDoubleTap: () => controller.toAdminLoginPage(),
                child: SvgPicture.asset(
                  'assets/icons/uncp-color.svg',
                  height: 80,
                ),
              ),
            ),
            const AtLoginContent(),
            const Expanded(
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
