import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:projector_loan/module/admin/adm_dashboard/view/adm_dashboard_view.dart';
import 'package:projector_loan/module/admin/adm_lcd_data/view/adm_lcd_data_view.dart';
import 'package:projector_loan/shared/widget/tab_bar_item/tab_bar_item.dart';
import 'package:projector_loan/state_util.dart';
import '../view/adm_main_navigation_view.dart';

class AdmMainNavigationController extends State<AdmMainNavigationView>
    implements MvcController {
  static late AdmMainNavigationController instance;

  late AdmMainNavigationView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  int selectedIndex = 0;

  onItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> widgetOptions = const [
    AdmDashboardView(),
    AdmLcdDataView(),
  ];

  List<FlashyTabBarItem> navBarsItems() {
    return [
      tabBarItem(
        iconUrl: 'dashboard.svg',
        title: 'Dashboard',
      ),
      tabBarItem(
        iconUrl: 'projector.svg',
        title: 'LCD Data',
      ),
    ];
  }
}
