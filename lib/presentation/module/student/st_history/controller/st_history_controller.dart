import 'dart:developer';

import 'package:projector_loan/core.dart';

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

  //loan data stream
  Stream loanDataStream({required String status}) {
    return FirebaseFirestore.instance
        .collection('loan_data')
        .where("status", isEqualTo: status)
        .where("student_email", isEqualTo: currentUser.email)
        .snapshots();
  }

  doCancelRequest({
    required String lcdId,
  }) async {
    await confirmationDialog(
      message: "Batalkan Request Peminjaman?",
      onYes: () async {
        await LoanService.deleteLoanData(lcdId: lcdId);
        Get.back();
        log("Request Canceled");
      },
    );
  }

  doReturnedRequest({
    required String lcdId,
  }) async {
    await confirmationDialog(
      message: "Ajukan Pengembalian LCD?",
      onYes: () async {
        await LoanService.returnRequest(
          lcdId: lcdId,
          onReturn: true,
        );
        await FirebaseFirestore.instance
            .collection("loan_data")
            .doc(lcdId)
            .update({
          "return_date": Timestamp.now(),
        });
        Get.back();
        log("Request a Refund");
      },
    );
  }
}
