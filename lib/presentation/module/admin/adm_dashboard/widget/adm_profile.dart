import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projector_loan/core.dart';
import 'package:projector_loan/data/model/admin_data_model.dart';
import 'package:projector_loan/presentation/module/admin/adm_dashboard/controller/adm_dashboard_controller.dart';
import 'package:projector_loan/presentation/module/admin/adm_dashboard/widget/adm_profile_card.dart';

class AdmProfile extends StatelessWidget {
  const AdmProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AdmDashboardController controller = AdmDashboardController.instance;
    return Container(
      height: 130.0,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.4),
        borderRadius: BorderRadius.circular(25),
      ),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('admin_data')
            .where('email', isEqualTo: controller.currentUser.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData) {
            return Center(
              child: Text(
                "Failed Load Data",
                style: GoogleFonts.openSans(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else {
            final data = AdminData.fromFirestore(snapshot.data!.docs[0]);

            return AdmProfileCard(
              imgUrl: data.img,
              name: data.name,
              job: data.job,
              nip: data.nip,
            );
          }
        },
      ),
    );
  }
}
