import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projector_loan/module/student/st_home/controller/st_home_controller.dart';
import 'package:projector_loan/module/student/st_home/widget/st_scanner_button.dart';
import 'package:projector_loan/module/student/st_home/widget/st_top_profile.dart';
import 'package:projector_loan/module/student/st_home/widget/st_top_profile_loading.dart';

class StHomeView extends StatefulWidget {
  const StHomeView({Key? key}) : super(key: key);

  Widget build(context, StHomeController controller) {
    controller.view = this;

    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(
          top: 50,
          left: 20,
          right: 20,
        ),
        child: ListView(
          children: [
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('students')
                  .where("email", isEqualTo: controller.currentUser.email)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const StTopProfileLoading();
                }

                final doc = snapshot.data!.docs.first;
                // final email = doc.get('email') as String;
                final name = doc.get('name') as String;
                final imgUrl = doc.get('foto') as String;
                // final nim = doc.get('nim') as String;
                // final role = doc.get('role') as String;
                return StTopProfile(
                  imgUrl: imgUrl,
                  name: name,
                );
                // return StTopProfile(
                //   // imgUrl: "https://bit.ly/43wLLI7",
                //   name: name,
                // );
              },
            ),
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
