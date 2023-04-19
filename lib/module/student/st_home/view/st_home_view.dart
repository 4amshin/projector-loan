import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projector_loan/core.dart';
import 'package:projector_loan/module/student/st_home/controller/st_home_controller.dart';
import 'package:projector_loan/module/student/st_home/widget/st_bottom_content.dart';
import 'package:projector_loan/module/student/st_home/widget/st_mid_content.dart';
import 'package:projector_loan/module/student/st_home/widget/st_scanner_button.dart';
import 'package:projector_loan/module/student/st_home/widget/st_top_profile.dart';
import 'package:projector_loan/module/student/st_home/widget/st_top_profile_loading.dart';

class StHomeView extends StatefulWidget {
  const StHomeView({Key? key}) : super(key: key);

  Widget build(context, StHomeController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: homeBackground.withOpacity(0.3),
      body: SafeArea(
        child: ListView(
          children: const [
            StTopProfile(),
            StMidContent(),
            StBottomContent(),
          ],
        ),
      ),
      floatingActionButton: StScannerButton(
        onTap: () => controller.scanQrCode(),
      ),
    );
  }

  @override
  State<StHomeView> createState() => StHomeController();
}
