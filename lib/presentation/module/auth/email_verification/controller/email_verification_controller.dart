import 'dart:async';
import 'dart:developer';

import 'package:projector_loan/core.dart';

class EmailVerificationController extends State<EmailVerificationView>
    implements MvcController {
  static late EmailVerificationController instance;
  late EmailVerificationView view;

  bool isEmailVerified = false;
  Timer? timer;

  @override
  void initState() {
    instance = this;
    log("Email Verification Page");

    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      log("Pengguna tidak terdaftar");
      toLoginView();
      return;
    }

    log("Current User: ${currentUser.email}");

    isEmailVerified = currentUser.emailVerified;
    setState(() {});
    log("Is Email Verified = $isEmailVerified");

    if (!isEmailVerified) {
      resendEmailVerification();

      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => _checkEmailVerified(),
      );
    }
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  void _checkEmailVerified() {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null && currentUser.emailVerified) {
      log("Email Verified = $isEmailVerified");
      ShowSnackBar.show(context, message: "Email telah terverifikasi");
      timer?.cancel();
    }
  }

  Future<void> resendEmailVerification() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      try {
        log("Sending Email Verification");
        await currentUser.sendEmailVerification();
      } on FirebaseAuthException catch (e) {
        log(e.toString());
        ShowSnackBar.show(context, message: e.toString());
      } catch (e) {
        e.toString();
        ShowSnackBar.show(context, message: e.toString());
      }
    }
  }

  toLoginView() {
    Get.offAll(const LoginView());
  }
}
