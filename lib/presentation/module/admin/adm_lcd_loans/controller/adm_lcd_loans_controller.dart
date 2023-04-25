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
    required String lcdId,
    required String status,
  }) async {
    await confirmationDialog(
      message: "LCD Dikembalikan?",
      onYes: () async {
        await LoanService.updateLoanStatus(
          lcdId: lcdId,
          status: status,
          onReturn: false,
        );
        await FirebaseFirestore.instance
            .collection("loan_data")
            .doc(lcdId)
            .update({
          "return_date": Timestamp.now(),
        });
        await LcdService.updateLCDStatus(
          lcdId: lcdId,
          status: "Tersedia",
        );
        Get.back();
        log("LCD Returned");
      },
    );
  }
}
