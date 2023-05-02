// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoanHistory {
  final String lcdId;
  final String lcdName;
  final DateTime loanDate;
  final DateTime returnDate;
  final String status;
  final String studentEmail;
  final String studentName;
  final String studentNim;
  final String studentProfile;
  LoanHistory({
    required this.lcdId,
    required this.lcdName,
    required this.loanDate,
    required this.returnDate,
    required this.status,
    required this.studentEmail,
    required this.studentName,
    required this.studentNim,
    required this.studentProfile,
  });

  factory LoanHistory.fromFirebase(Map<String, dynamic> map) {
    return LoanHistory(
      lcdId: map['lcd_id'] ?? '',
      lcdName: map['lcd_name'] ?? '',
      loanDate: map['loan_date'].toDate() ?? '',
      returnDate: map['loan_date'].toDate() ?? DateTime.now(),
      status: map['status'] ?? '',
      studentEmail: map['student_email'] ?? '',
      studentName: map['student_name'] ?? '',
      studentNim: map['student_nim'] ?? '',
      studentProfile: map['student_profile'] ?? '',
    );
  }
}
