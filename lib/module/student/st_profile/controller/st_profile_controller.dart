import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projector_loan/core.dart';
import 'package:projector_loan/shared/widget/dialog/confirmation_dialog.dart';

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
    required String imgUrl,
    required String docId,
    required String name,
    required String nim,
  }) {
    log("Navigate to Edit Profile Page");
    Get.to(
      StProfileEditFormView(
        docId: docId,
        imgUrl: imgUrl,
        name: name,
        nim: nim,
      ),
    );
  }
}
