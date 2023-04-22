// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class Student {
  final String name;
  final String nim;
  final String role;
  final String email;
  final String imgUrl;
  final DocumentReference reference;

  Student({
    required this.name,
    required this.nim,
    required this.role,
    required this.email,
    required this.imgUrl,
    required this.reference,
  });

  factory Student.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Student(
      name: data['name'] ?? '',
      nim: data['nim'] ?? '',
      role: data['role'] ?? '',
      email: data['email'] ?? '',
      imgUrl: data['foto'] ?? '',
      reference: doc.reference,
    );
  }

  //getter method
  String get id => reference.id;
}
