import 'dart:developer';

import 'package:projector_loan/core.dart';

class StProfileController extends State<StProfileView>
    implements MvcController {
  static late StProfileController instance;
  late StProfileView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  final currentUser = FirebaseAuth.instance.currentUser!;

  doLogOut() {
    confirmationDialog(
      message: 'Kamu yakin ingin Logout?',
      onYes: () async {
        try {
          log("Logging Out");
          await FirebaseAuth.instance.signOut();
          Get.offAll(const LoginView());
        } on Exception catch (e) {
          log(e.toString());
        }
      },
    );
  }

  toEditProfile({
    required Student student,
  }) {
    log("Navigate to Edit Profile Page");
    Get.to(
      StProfileEditFormView(
        student: student,
      ),
    );
  }
}
