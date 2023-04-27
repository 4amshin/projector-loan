import 'package:projector_loan/core.dart';

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
        child: ListView(
          children: const [],
        ),
      ),
    );
  }

  @override
  State<AdmDashboardView> createState() => AdmDashboardController();
}
