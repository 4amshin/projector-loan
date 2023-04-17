import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:projector_loan/core.dart';
import 'package:projector_loan/state_util.dart';
import '../view/adm_lcd_loans_view.dart';

class AdmLcdLoansController extends State<AdmLcdLoansView>
    implements MvcController {
  static late AdmLcdLoansController instance;
  late AdmLcdLoansView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  acceptRequest({
    required String docId,
    required String status,
  }) async {
    await confirmationDialog(
      message: "Terima Request?",
      onYes: () async {
        await LoanService.updateLoanStatus(
          docId: docId,
          status: status,
        );
        Get.back();
        log("Request Accepted");
      },
    );
  }

  rejectRequest({
    required String docId,
  }) async {
    await confirmationDialog(
      message: "Tolak Request?",
      onYes: () async {
        await LoanService.deleteLoanData(
          docId: docId,
        );
        Get.back();
        log("Request Rejected.....\nDeleting Request");
      },
    );
  }
}
