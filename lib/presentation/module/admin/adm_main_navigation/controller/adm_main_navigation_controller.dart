import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:projector_loan/core.dart';

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
    AdmLcdLoansView(),
    AdmLcdDataView(),
  ];

  List<FlashyTabBarItem> navBarsItems() {
    return [
      tabBarItem(
        iconUrl: 'dashboard.svg',
        title: 'Dashboard',
      ),
      tabBarItem(
        iconUrl: 'history.svg',
        title: 'Peminjaman',
      ),
      tabBarItem(
        iconUrl: 'projector.svg',
        title: 'LCD Data',
      ),
    ];
  }
}
