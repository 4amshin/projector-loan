import 'package:cloud_firestore/cloud_firestore.dart';

class LoanService {
  static addLoanData({
    required String lcdId,
    required String lcdName,
    required String studentName,
    required String studentEmail,
    required String studentNim,
    required String studentProfile,
  }) async {
    await FirebaseFirestore.instance.collection("loan_data").add({
      "lcd_id": lcdId,
      "lcd_name": lcdName,
      "status": 'Request',
      "loan_date": Timestamp.now(),
      "student_email": studentEmail,
      "student_name": studentName,
      "student_nim": studentNim,
      "student_profile": studentProfile,
    });
  }

  static updateLoanStatus({
    required String docId,
    required String status,
  }) async {
    await FirebaseFirestore.instance.collection("loan_data").doc(docId).update({
      "status": status,
    });
  }
}
