// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:projector_loan/core.dart';
import 'package:intl/intl.dart';

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
              Map<String, dynamic> item = (data.docs[index].data());

              //initialize data
              // String studentName = item["student_name"];
              // String studentNim = item["student_nim"];
              // String studentImg = item["student_profile"];
              String lcdId = item["lcd_id"];
              String lcdName = item["lcd_name"];
              DateTime loanDate = item["loan_date"].toDate();
              DateTime returnDate =
                  item["return_date"]?.toDate() ?? DateTime.now();

              //initialize day and hour time
              //day format
              DateFormat dateFormat = DateFormat('EEEE, d MMMM y', 'id_ID');
              //hour format
              DateFormat timeFormat = DateFormat('hh:mm a');
              // format the date and time strings
              String dayTime = dateFormat.format(loanDate);
              String loanHour = timeFormat.format(loanDate);
              String hourReturned = timeFormat.format(returnDate);

              return StLoanStatusCard(
                lcdName: lcdName,
                dayTime: dayTime,
                loanHour: loanHour,
                returnHour: hourReturned,
                cancelRequest: cancelRequest,
                returnedRequest: returnedRequest,
                isReturned: status == 'Returned' ? true : false,
                onTap: () {
                  if (cancelRequest) {
                    controller.doCancelRequest(lcdId: lcdId);
                  } else if (returnedRequest) {
                    controller.doReturnedRequest(lcdId: lcdId);
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
