import 'package:projector_loan/core.dart';
import 'package:projector_loan/presentation/module/admin/adm_dashboard/widget/adm_menu.dart';
import 'package:projector_loan/presentation/module/admin/adm_dashboard/widget/adm_profile.dart';

class AdmDashboardView extends StatefulWidget {
  const AdmDashboardView({Key? key}) : super(key: key);

  Widget build(context, AdmDashboardController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(title: 'Admin Dashboard'),
        actions: [
          IconButton(
            onPressed: () => controller.doAdminLogout(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AdmProfile(),
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 20),
              child: Text(
                "Kategori",
                style: GoogleFonts.openSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const AdmMenu(),
          ],
        ),
      ),
    );
  }

  @override
  State<AdmDashboardView> createState() => AdmDashboardController();
}
