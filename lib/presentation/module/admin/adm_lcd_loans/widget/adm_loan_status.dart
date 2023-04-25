// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:projector_loan/core.dart';

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
              Map<String, dynamic> item = (data.docs[index].data());

              //initialize data
              String studentName = item["student_name"];
              String studentNim = item["student_nim"];
              String studentImg = item["student_profile"];
              String lcdName = item["lcd_name"];
              String lcdId = item["lcd_id"];
              // DateTime loanAt = item["loan_date"].toDate();

              bool requestRefund = item["on_return"];

              return LoanStatusCard(
                name: studentName,
                nim: studentNim,
                imgUrl: studentImg,
                lcdName: lcdName,
                requestButton: displayRequestButton,
                returnedButton: requestRefund,
                isRequest: status == 'Request' ? true : false,
                isReturned: status == 'Returned' ? true : false,
                onAccept: () {
                  if (displayRequestButton && acceptRequest) {
                    controller.acceptRequest(
                      lcdId: lcdId,
                      status: 'OnUse',
                    );
                  }
                },
                onReject: () {
                  if (displayRequestButton) {
                    controller.rejectRequest(lcdId: lcdId);
                  }
                },
                onReturn: () {
                  if (requestRefund) {
                    controller.confirmReturned(
                      lcdId: lcdId,
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
