import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:projector_loan/core.dart';
import '../controller/st_main_navigation_controller.dart';

class StMainNavigationView extends StatefulWidget {
  const StMainNavigationView({Key? key}) : super(key: key);

  Widget build(context, StMainNavigationController controller) {
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
  State<StMainNavigationView> createState() => StMainNavigationController();
}
