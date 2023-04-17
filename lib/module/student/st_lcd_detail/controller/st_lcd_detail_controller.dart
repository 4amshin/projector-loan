import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projector_loan/core.dart';
import 'package:projector_loan/module/student/st_lcd_detail/view/st_lcd_detail_view.dart';
import 'package:projector_loan/module/student/st_scanner/view/st_scanner_view.dart';
import 'package:projector_loan/services/loan_services/loan_service.dart';
import 'package:projector_loan/state_util.dart';

class StLcdDetailController extends State<StLcdDetailView>
    implements MvcController {
  static late StLcdDetailController instance;
  late StLcdDetailView view;

  @override
  void initState() {
    instance = this;
    scannedData = widget.scannedData;
    log("Data = ${widget.scannedData}");
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  final currentUser = FirebaseAuth.instance.currentUser!;

  String? scannedData;

  //get the lcd_Data stream
  Future<QuerySnapshot> getLcdData() async {
    return FirebaseFirestore.instance
        .collection("data_lcd")
        .where("lcd_id", isEqualTo: scannedData)
        .get();
  }

  //get the student_Data stream
  Future<QuerySnapshot> getStudentData() async {
    return FirebaseFirestore.instance
        .collection("students")
        .where("email", isEqualTo: currentUser.email)
        .get();
  }

  backToScannerPage() {
    log("Back to Scanner Page");
    Get.offAll(const StScannerView());
  }

  doLoanLcd() async {
    // Get Lcd Data
    QuerySnapshot lcdDataSnapshot = await getLcdData();
    final lcdDoc = lcdDataSnapshot.docs.first;
    String lcdId = lcdDoc['lcd_id'];
    String lcdName = lcdDoc['lcd_name'];

    // Get Student Data
    QuerySnapshot studentDataSnapshot = await getStudentData();
    final studentDoc = studentDataSnapshot.docs.first;
    String studentName = studentDoc['name'];
    String studentNim = studentDoc['nim'];
    String studentProfile = studentDoc['foto'];

    //Save data into Firebase 'loan_data' Collection

    try {
      log('Saving Loan Data');
      await LoanService.addLoanData(
        lcdId: lcdId,
        lcdName: lcdName,
        studentEmail: currentUser.email!,
        studentName: studentName,
        studentNim: studentNim,
        studentProfile: studentProfile,
      );
      log('Loan Data Saved');
      await showInfoDialog(message: "Request peminjaman telah dikirim");
      Get.offAll(const StMainNavigationView());
      log('Back to Dashboard');
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
