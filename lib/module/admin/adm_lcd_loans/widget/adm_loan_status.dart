// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:projector_loan/module/admin/adm_lcd_loans/controller/adm_lcd_loans_controller.dart';
import 'package:projector_loan/module/admin/adm_lcd_loans/widget/loan_status_card.dart';
import 'package:projector_loan/shared/widget/no_data/no_data_img.dart';

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
              item["id"] = data.docs[index].id;

              //initialize data
              String docId = item["id"];
              String studentName = item["student_name"];
              String studentNim = item["student_nim"];
              String studentImg = item["student_profile"];
              String lcdName = item["lcd_name"];
              DateTime loanAt = item["loan_date"].toDate();

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
                      docId: docId,
                      status: 'OnUse',
                    );
                  }
                },
                onReject: () {
                  if (displayRequestButton) {
                    controller.rejectRequest(docId: docId);
                  }
                },
                onReturn: () {
                  if (requestRefund) {
                    controller.confirmReturned(
                      docId: docId,
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