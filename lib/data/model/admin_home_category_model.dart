// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminHomeCategory {
  final String id;
  final String title;
  final String total;
  final String icon;
  final String color1;
  final String color2;

  AdminHomeCategory({
    required this.id,
    required this.title,
    required this.total,
    required this.icon,
    required this.color1,
    required this.color2,
  });

  factory AdminHomeCategory.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return AdminHomeCategory(
      id: doc.id,
      title: data['title'] ?? '',
      total: data['total'] ?? '',
      icon: data['icon'] ?? '',
      color1: data['color1'] ?? '',
      color2: data['color2'] ?? '',
    );
  }
}
