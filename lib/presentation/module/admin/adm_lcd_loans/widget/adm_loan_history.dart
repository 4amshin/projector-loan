// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:projector_loan/core.dart';

class AdmLoanHistory extends StatelessWidget {
  const AdmLoanHistory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AdmLcdLoansController controller = AdmLcdLoansController.instance;
    return SafeArea(
      minimum: const EdgeInsets.all(15),
      child: StreamBuilder(
        stream: controller.loanHistoryStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            log("No Data Found");
            return const NoDataImg();
          } else {
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
                );
              },
            );
          }
        },
      ),
    );
  }
}
