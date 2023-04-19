import 'package:cloud_firestore/cloud_firestore.dart';

class LoanTerm {
  final String title;
  final String color;
  final List<String> list;

  LoanTerm({
    required this.title,
    required this.color,
    required this.list,
  });

  factory LoanTerm.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    final list = List<String>.from(data['list'] ?? []);
    return LoanTerm(
      title: data['title'] ?? '',
      color: data['color'] ?? '',
      list: list,
    );
  }
}
