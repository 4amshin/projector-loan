// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:projector_loan/core.dart';
import 'package:projector_loan/data/model/loan_data_model.dart';

class AdmLoanStatus extends StatelessWidget {
  final String status;
  final bool displayRequestButton;
  final bool acceptRequest;
  const AdmLoanStatus({
    Key? key,
    required this.status,
    this.displayRequestButton = false,
    this.acceptRequest = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AdmLcdLoansController controller = AdmLcdLoansController.instance;
    return SafeArea(
      minimum: const EdgeInsets.all(15),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('loan_data')
            .where("status", isEqualTo: status)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return const Center(child: Text("Error"));
          if (snapshot.data == null) {
            return const Center(child: Text("Data Null"));
          }
          if (snapshot.data!.docs.isEmpty) {
            log("No Data");
            return const NoDataImg();
          }

          final data = snapshot.data!;

          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: data.docs.length,
            itemBuilder: (context, index) {
              final item = LoanData.fromFirebase(data.docs[index].data());

              // bool requestRefund = item.onReturn;

              return LoanStatusCard(
                name: item.studentName,
                nim: item.studentNim,
                imgUrl: item.studentProfile,
                lcdName: item.lcdName,
                requestButton: displayRequestButton,
                returnedButton: item.onReturn,
                isRequest: status == 'Request' ? true : false,
                isReturned: status == 'Returned' ? true : false,
                onAccept: () {
                  if (displayRequestButton && acceptRequest) {
                    controller.acceptRequest(
                      lcdId: item.lcdId,
                      status: 'OnUse',
                    );
                  }
                },
                onReject: () {
                  if (displayRequestButton) {
                    controller.rejectRequest(lcdId: item.lcdId);
                  }
                },
                onReturn: () {
                  if (item.onReturn) {
                    controller.confirmReturned(
                      lcdId: item.lcdId,
                      status: 'Returned',
                    );
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
