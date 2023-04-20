import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projector_loan/core.dart';

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

  toLcdStatusPage() {
    log("Navigate to Lcd Status Page");
    Get.to(const StLcdStatusListView());
  }
}
