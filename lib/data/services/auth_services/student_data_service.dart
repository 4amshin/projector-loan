import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class StudentData {
  static Future<void> saveStudentData({
    required String imgUrl,
    required String name,
    required String nim,
  }) async {
    try {
      await FirebaseFirestore.instance.collection("students").doc(nim).update({
        "foto": imgUrl,
        "name": name,
        "nim": nim,
      });
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<void> addStudentData({
    required String email,
    required String name,
    required String nim,
  }) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection("students")
          .where("email", isEqualTo: email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final docId = querySnapshot.docs[0].id;
        await FirebaseFirestore.instance
            .collection("students")
            .doc(docId)
            .update({
          "name": name,
          "nim": nim,
        });
      } else {
        await FirebaseFirestore.instance.collection("students").add({
          "foto": "https://bit.ly/413L5Z3",
          "email": email,
          "name": name,
          "nim": nim,
          "role": "Mahasiswa",
        });
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<void> updateStudentData({
    required String docId,
    required String imgUrl,
    required String name,
    required String nim,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection("students")
          .doc(docId)
          .update({
        "foto": imgUrl,
        "name": name,
        "nim": nim,
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
