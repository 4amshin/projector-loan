// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoanData {
  final String lcdId;
  final String lcdName;
  final DateTime loanDate;
  final bool onReturn;
  final String status;
  final String studentEmail;
  final String studentName;
  final String studentNim;
  final String studentProfile;
  LoanData({
    required this.lcdId,
    required this.lcdName,
    required this.loanDate,
    required this.onReturn,
    required this.status,
    required this.studentEmail,
    required this.studentName,
    required this.studentNim,
    required this.studentProfile,
  });

  factory LoanData.fromFirebase(Map<String, dynamic> map) {
    return LoanData(
      lcdId: map['lcd_id'] ?? '',
      lcdName: map['lcd_name'] ?? '',
      loanDate: map['loan_date'].toDate() ?? '',
      onReturn: map['on_return'] ?? '',
      status: map['status'] ?? '',
      studentEmail: map['student_email'] ?? '',
      studentName: map['student_name'] ?? '',
      studentNim: map['student_nim'] ?? '',
      studentProfile: map['student_profile'] ?? '',
    );
  }
}
