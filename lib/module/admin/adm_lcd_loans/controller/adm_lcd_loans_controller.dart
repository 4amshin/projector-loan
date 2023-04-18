import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projector_loan/core.dart';

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

  confirmReturned({
    required String docId,
    required String status,
  }) async {
    await confirmationDialog(
      message: "LCD Dikembalikan?",
      onYes: () async {
        await LoanService.updateLoanStatus(
          docId: docId,
          status: status,
          onReturn: false,
        );
        await FirebaseFirestore.instance
            .collection("loan_data")
            .doc(docId)
            .update({
          "return_date": Timestamp.now(),
        });
        Get.back();
        log("LCD Returned");
      },
    );
  }
}
