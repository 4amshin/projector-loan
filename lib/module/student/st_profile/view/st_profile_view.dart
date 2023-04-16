import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projector_loan/module/student/st_profile/controller/st_profile_controller.dart';
import 'package:projector_loan/module/student/st_profile/widget/st_logout_button.dart';
import 'package:projector_loan/module/student/st_profile/widget/st_profile_detail.dart';
import 'package:projector_loan/module/student/st_profile/widget/st_profile_image.dart';
import 'package:projector_loan/module/student/st_profile/widget/st_profile_view_loading.dart';

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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                StLogoutButton(
                  onTap: () => controller.doLogOut(),
                ),
              ],
            ),
            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('students')
                  .where("email", isEqualTo: controller.currentUser.email)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const StProfileViewLoading();
                }

                final doc = snapshot.data!.docs.first;
                final docId = doc.id;
                final email = doc.get('email') as String;
                final imgUrl = doc.get('foto') as String;
                final name = doc.get('name') as String;
                final nim = doc.get('nim') as String;
                // final role = doc.get('role') as String;

                return Expanded(
                  child: ListView(
                    children: [
                      const SizedBox(height: 35),
                      StProfileImage(
                        imgUrl: imgUrl,
                        name: name,
                        nim: nim,
                        onEdit: () => controller.toEditProfile(
                          docId: docId,
                          imgUrl: imgUrl,
                          name: name,
                          nim: nim,
                        ),
                      ),
                      const SizedBox(height: 25),
                      const StProfileDetail(),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<StProfileView> createState() => StProfileController();
}
