import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import '../controller/adm_main_navigation_controller.dart';

class AdmMainNavigationView extends StatefulWidget {
  const AdmMainNavigationView({Key? key}) : super(key: key);

  Widget build(context, AdmMainNavigationController controller) {
    controller.view = this;

    return Scaffold(
      body: controller.widgetOptions.elementAt(controller.selectedIndex),
      bottomNavigationBar: FlashyTabBar(
        backgroundColor: Colors.white,
        selectedIndex: controller.selectedIndex,
        showElevation: true,
        onItemSelected: (index) => controller.onItemSelected(index),
        items: controller.navBarsItems(),
      ),
    );
  }

  @override
  State<AdmMainNavigationView> createState() => AdmMainNavigationController();
}
