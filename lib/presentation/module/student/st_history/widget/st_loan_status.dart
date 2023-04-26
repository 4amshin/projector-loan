// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:projector_loan/core.dart';
import 'package:intl/intl.dart';
import 'package:projector_loan/presentation/shared/util/date_format/date_format_util.dart';

class StLoanStatus extends StatelessWidget {
  final String status;
  final bool cancelRequest;
  final bool returnedRequest;
  const StLoanStatus({
    Key? key,
    required this.status,
    this.cancelRequest = false,
    this.returnedRequest = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StHistoryController controller = StHistoryController.instance;
    return SafeArea(
      minimum: const EdgeInsets.all(15),
      child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('loan_data')
            .where("status", isEqualTo: status)
            .where("student_email", isEqualTo: controller.currentUser.email)
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

              return StLoanStatusCard(
                lcdName: item.lcdName,
                dayTime: TimeUtil.formatDayTime(item.loanDate),
                loanHour: TimeUtil.formatHourTime(item.loanDate),
                returnHour: TimeUtil.formatHourTime(item.returnDate),
                cancelRequest: cancelRequest,
                returnedRequest: returnedRequest,
                isReturned: status == 'Returned' ? true : false,
                onTap: () {
                  if (cancelRequest) {
                    controller.doCancelRequest(lcdId: item.lcdId);
                  } else if (returnedRequest) {
                    controller.doReturnedRequest(lcdId: item.lcdId);
                  } else {
                    null;
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
