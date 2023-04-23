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
