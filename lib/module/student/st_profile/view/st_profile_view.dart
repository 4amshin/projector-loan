import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projector_loan/module/student/st_profile/controller/st_profile_controller.dart';
import 'package:projector_loan/module/student/st_profile/widget/st_logout_button.dart';
import 'package:projector_loan/module/student/st_profile/widget/st_profile_detail.dart';
import 'package:projector_loan/module/student/st_profile/widget/st_profile_stream.dart';

class StProfileView extends StatefulWidget {
  const StProfileView({Key? key}) : super(key: key);

  Widget build(context, StProfileController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: Colors.blueGrey.withOpacity(0.05),
      body: SafeArea(
        minimum: const EdgeInsets.only(
          left: 25,
          right: 25,
          top: 45,
        ),
        child: Column(
          children: [
            StLogoutButton(onTap: () => controller.doLogOut()),
            const StProfileStream(),
            const StProfileDetail(),
          ],
        ),
      ),
    );
  }

  @override
  State<StProfileView> createState() => StProfileController();
}
