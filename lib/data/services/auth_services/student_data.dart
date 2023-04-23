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
}
