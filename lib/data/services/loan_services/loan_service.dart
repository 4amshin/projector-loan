import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projector_loan/data/model/loan_data_model.dart';

class LoanService {
  static addLoanData({
    required String lcdId,
    required String lcdName,
    required String studentName,
    required String studentEmail,
    required String studentNim,
    required String studentProfile,
  }) async {
    await FirebaseFirestore.instance.collection("loan_data").doc(lcdId).set({
      "lcd_id": lcdId,
      "lcd_name": lcdName,
      "status": 'Request',
      "loan_date": Timestamp.now(),
      "on_return": false,
      "student_email": studentEmail,
      "student_name": studentName,
      "student_nim": studentNim,
      "student_profile": studentProfile,
    });
  }

  static addLoanHistory({
    required LoanData data,
  }) async {
    await FirebaseFirestore.instance.collection("loan_history").add({
      "lcd_id": data.lcdId,
      "lcd_name": data.lcdName,
      "status": 'Returned',
      "loan_date": data.loanDate,
      "return_date": Timestamp.now(),
      "student_email": data.studentEmail,
      "student_name": data.studentName,
      "student_nim": data.studentNim,
      "student_profile": data.studentProfile,
    });
  }

  static updateLoanStatus({
    required String lcdId,
    required String status,
    final bool? onReturn,
  }) async {
    await FirebaseFirestore.instance.collection("loan_data").doc(lcdId).update({
      "status": status,
      "on_return": onReturn ?? false,
    });
  }

  static returnRequest({
    required String lcdId,
    required bool onReturn,
  }) async {
    await FirebaseFirestore.instance.collection("loan_data").doc(lcdId).update({
      "on_return": onReturn,
    });
  }

  static deleteLoanData({
    required String lcdId,
  }) async {
    await FirebaseFirestore.instance
        .collection("loan_data")
        .doc(lcdId)
        .delete();
  }
}
