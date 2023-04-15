import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projector_loan/core.dart';
import 'package:projector_loan/module/student/st_home/view/st_home_view.dart';
import 'package:projector_loan/module/student/st_scanner/view/st_scanner_view.dart';
import 'package:projector_loan/state_util.dart';

class StHomeController extends State<StHomeView> implements MvcController {
  static late StHomeController instance;
  late StHomeView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  final currentUser = FirebaseAuth.instance.currentUser!;

  scanQrCode() {
    Get.to(const StScannerView());
  }
}
