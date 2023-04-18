import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:projector_loan/services/loan_services/loan_service.dart';
import 'package:projector_loan/shared/widget/dialog/confirmation_dialog.dart';
import 'package:projector_loan/state_util.dart';
import '../view/st_history_view.dart';

class StHistoryController extends State<StHistoryView>
    implements MvcController {
  static late StHistoryController instance;
  late StHistoryView view;

  @override
  void initState() {
    instance = this;
    initializeDateFormatting('id_ID', null);
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  final currentUser = FirebaseAuth.instance.currentUser!;

  doCancelRequest({
    required String docId,
  }) async {
    await confirmationDialog(
      message: "Batalkan Request Peminjaman?",
      onYes: () async {
        await LoanService.deleteLoanData(
          docId: docId,
        );
        Get.back();
        log("Request Canceled");
      },
    );
  }

  doReturnedRequest({
    required String docId,
  }) async {
    await confirmationDialog(
      message: "Ajukan Pengembalian LCD?",
      onYes: () async {
        await LoanService.returnRequest(
          docId: docId,
          onReturn: true,
        );
        await FirebaseFirestore.instance
            .collection("loan_data")
            .doc(docId)
            .update({
          "return_date": Timestamp.now(),
        });
        Get.back();
        log("Request a Refund");
      },
    );
  }
}
