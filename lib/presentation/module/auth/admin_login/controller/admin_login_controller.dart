import 'dart:developer';

import 'package:projector_loan/presentation/module/auth/admin_login/view/admin_login_view.dart';

import 'package:projector_loan/core.dart';

class AdminLoginController extends State<AdminLoginView>
    implements MvcController {
  static late AdminLoginController instance;
  late AdminLoginView view;

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
  doAdminLogin() async {
    AuthService.signInWithEmail(
      context,
      isAdmin: true,
      email: email!,
      password: password!,
    );

    // await AuthService.adminLogin(
    //   context,
    //   username: username!,
    //   password: password!,
    // );
  }
}
