import 'package:projector_loan/core.dart';
import 'package:projector_loan/data/model/admin_data_model.dart';
import 'package:projector_loan/presentation/module/admin/adm_dashboard/widget/adm_profile_card.dart';
import 'package:projector_loan/presentation/shared/widget/loading/adm_profile_card_loading.dart';

class AdmProfile extends StatelessWidget {
  const AdmProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AdmDashboardController controller = AdmDashboardController.instance;
    return Container(
      height: 130.0,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      decoration: BoxDecoration(
        color: Colors.indigo.withOpacity(0.3),
        borderRadius: BorderRadius.circular(25),
      ),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('admin_data')
            .where('email', isEqualTo: controller.currentUser.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const AdmProfileCardLoading();
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
