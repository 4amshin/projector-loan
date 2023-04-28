import 'package:cloud_firestore/cloud_firestore.dart';

class AdminHomeCategory {
  final String id;
  final String title;
  final String total;
  final String icon;

  AdminHomeCategory({
    required this.id,
    required this.title,
    required this.total,
    required this.icon,
  });

  factory AdminHomeCategory.fromFirestore(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    return AdminHomeCategory(
      id: document.id,
      title: data['title'] ?? '',
      total: data['total'] ?? '',
      icon: data['icon'] ?? '',
    );
  }
}
