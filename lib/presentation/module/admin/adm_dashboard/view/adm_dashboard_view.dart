import 'package:flutter/material.dart';
import 'package:projector_loan/presentation/module/admin/adm_dashboard/controller/adm_dashboard_controller.dart';
import 'package:projector_loan/presentation/module/student/st_home/widget/st_top_profile.dart';
import 'package:projector_loan/presentation/shared/widget/appBar_title/app_bar_title.dart';

class AdmDashboardView extends StatefulWidget {
  const AdmDashboardView({Key? key}) : super(key: key);

  Widget build(context, AdmDashboardController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(title: 'Admin Dashboard'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: const [
            StTopProfile(),
          ],
        ),
      ),
    );
  }

  @override
  State<AdmDashboardView> createState() => AdmDashboardController();
}
