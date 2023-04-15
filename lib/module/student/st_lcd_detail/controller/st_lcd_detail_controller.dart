import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:projector_loan/core.dart';
import 'package:projector_loan/module/student/st_lcd_detail/view/st_lcd_detail_view.dart';
import 'package:projector_loan/module/student/st_scanner/view/st_scanner_view.dart';
import 'package:projector_loan/state_util.dart';

class StLcdDetailController extends State<StLcdDetailView>
    implements MvcController {
  static late StLcdDetailController instance;
  late StLcdDetailView view;

  @override
  void initState() {
    instance = this;
    log("Data = ${widget.scannedData}");
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  backToScannerPage() {
    log("Back to Scanner Page");
    Get.offAll(const StScannerView());
  }
}
