import 'package:flutter/material.dart';
import 'package:projector_loan/state_util.dart';
import '../view/adm_dashboard_view.dart';

class AdmDashboardController extends State<AdmDashboardView>
    implements MvcController {
  static late AdmDashboardController instance;
  late AdmDashboardView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
