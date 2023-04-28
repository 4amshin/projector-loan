import 'package:cloud_firestore/cloud_firestore.dart';

class AdminData {
  final String id;
  final String email;
  final String img;
  final String name;
  final String job;
  final String nip;

  AdminData({
    required this.id,
    required this.email,
    required this.img,
    required this.name,
    required this.job,
    required this.nip,
  });

  factory AdminData.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return AdminData(
      id: doc.id,
      email: data['email'],
      img: data['img'],
      name: data['name'],
      job: data['job'],
      nip: data['nip'],
    );
  }
}
