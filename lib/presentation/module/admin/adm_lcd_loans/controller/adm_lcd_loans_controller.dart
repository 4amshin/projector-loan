import 'dart:developer';

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

  // loan data stream
  Stream loanDataStream({required String status}) {
    return FirebaseFirestore.instance
        .collection('loan_data')
        .where("status", isEqualTo: status)
        .snapshots();
  }

  // loan history stream
  Stream loanHistoryStream() {
    return FirebaseFirestore.instance
        .collection('loan_history')
        .orderBy('return_date', descending: true)
        .snapshots();
  }

  acceptRequest({
    required String lcdId,
    required String status,
  }) async {
    await confirmationDialog(
      message: "Terima Request?",
      onYes: () async {
        await LoanService.updateLoanStatus(
          lcdId: lcdId,
          status: status,
        );
        await LcdService.updateLCDStatus(
          lcdId: lcdId,
          status: "Dipakai",
        );
        Get.back();
        log("Request Accepted");
      },
    );
  }

  rejectRequest({
    required String lcdId,
  }) async {
    await confirmationDialog(
      message: "Tolak Request?",
      onYes: () async {
        await LoanService.deleteLoanData(
          lcdId: lcdId,
        );
        Get.back();
        log("Request Rejected.....\nDeleting Request");
      },
    );
  }

  confirmReturned({
    required LoanData data,
  }) async {
    await confirmationDialog(
      message: "LCD Dikembalikan?",
      onYes: () async {
        //delete loan data
        await LoanService.deleteLoanData(
          lcdId: data.lcdId,
        );

        //move it to loan history collection
        log("${data.lcdId} Loan Data Delete");
        await LoanService.addLoanHistory(data: data);
        log("${data.lcdId} Added to Loan History");

        //update the lcd status in inventory to be available
        await LcdService.updateLCDStatus(
          lcdId: data.lcdId,
          status: "Tersedia",
        );

        //close dialog
        Get.back();
      },
    );
  }
}
