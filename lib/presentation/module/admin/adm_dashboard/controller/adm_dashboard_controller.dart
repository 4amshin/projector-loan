import 'dart:developer';

import 'package:projector_loan/core.dart';

class AdmDashboardController extends State<AdmDashboardView>
    implements MvcController {
  static late AdmDashboardController instance;
  late AdmDashboardView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  doAdminLogout() {
    confirmationDialog(
      message: 'Kamu yakin ingin Logout?',
      onYes: () {
        log("Admin Exit");
        Get.offAll(const LoginView());
      },
    );
  }
}
