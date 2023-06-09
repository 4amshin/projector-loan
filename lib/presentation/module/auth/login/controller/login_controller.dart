import 'dart:developer';

import 'package:projector_loan/core.dart';
import 'package:projector_loan/presentation/module/auth/admin_login/view/admin_login_view.dart';

class LoginController extends State<LoginView> implements MvcController {
  static late LoginController instance;
  late LoginView view;

  @override
  void initState() {
    instance = this;
    log("Login Page");
    log("Current User = ${currentUser?.email}");
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  final currentUser = FirebaseAuth.instance.currentUser;

  //login textfield variable
  String? email;
  String? password;

  // execute login operation
  doLoginWithEmail() {
    AuthService.signInWithEmail(
      context,
      isAdmin: false,
      email: email!,
      password: password!,
    );
  }

  toRegisterView() {
    Get.offAll(const RegisterView());
  }

  toAdminLoginPage() {
    Get.to(const AdminLoginView());
  }

  forgetPasswordView() {
    log("Navigate to Forget Password Page");
    Get.to(const ForgotPasswordView());
  }
}
