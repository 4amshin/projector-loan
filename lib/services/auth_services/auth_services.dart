import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projector_loan/module/student/st_main_navigation/view/st_main_navigation_view.dart';
import 'package:projector_loan/shared/widget/snackbar/show_snackbar.dart';
import 'package:projector_loan/state_util.dart';

class AuthService {
  static Future<void> createNewUser({
    required String email,
    required String password,
  }) async {
    try {
      //create user
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //send email verification
      // await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      // log('Email verification sent to ${FirebaseAuth.instance.currentUser!.email}');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<void> signInWithEmail(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user?.emailVerified == true) {
        log("Navigate to Student Dashboard");
        Get.offAll(const StMainNavigationView());
      } else {
        ShowSnackBar.show(context, message: "Email belum diverifikasi");
        await userCredential.user?.sendEmailVerification();
        ShowSnackBar.show(context, message: "Mengirim Link Verifikasi");
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          ShowSnackBar.show(context, message: "Pengguna tidak ditemukan");

          break;
        case 'invalid-email':
          ShowSnackBar.show(context, message: "Email tidak terdaftar");

          break;
        case 'wrong-password':
          ShowSnackBar.show(context, message: "Password anda salah");

          break;
        default:
          log("Error during login: $e");
          ShowSnackBar.show(context, message: "Terjadi kesalahan saat login");
      }
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
          .where("nim", isEqualTo: nim)
          .where("email", isEqualTo: email)
          .get();

      if (querySnapshot.docs.isEmpty) {
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
