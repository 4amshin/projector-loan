// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:projector_loan/core.dart';
import 'package:projector_loan/module/student/st_history/widget/st_loan_status_card.dart';
import 'package:projector_loan/shared/widget/no_data/no_data_img.dart';

class StLoanStatus extends StatelessWidget {
  final String status;

  const StLoanStatus({
    Key? key,
    required this.status,
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
              item["id"] = data.docs[index].id;

              //initialize data
              String docId = item["id"];
              String studentName = item["student_name"];
              String studentNim = item["student_nim"];
              String studentImg = item["student_profile"];
              String lcdName = item["lcd_name"];
              DateTime dateTime = item["loan_date"].toDate();

              //initialize day and hour time
              //day format
              DateFormat dateFormat = DateFormat('EEEE, d MMMM y', 'id_ID');
              //hour format
              DateFormat timeFormat = DateFormat('hh:mm a');
              // format the date and time strings
              String dayTime = dateFormat.format(dateTime);
              String hourTime = timeFormat.format(dateTime);

              return StLoanStatusCard(
                lcdName: lcdName,
                dayTime: dayTime,
                hourTime: hourTime,
              );
            },
          );
        },
      ),
    );
  }
}
