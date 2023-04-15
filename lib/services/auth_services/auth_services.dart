import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  static Future<String?> signInWithEmail(String email, String password) async {
    try {
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = userCredential.user;
      if (user != null) {
        await user
            .reload(); // Reload user to get updated email verification status
        if (user.emailVerified) {
          return user.uid;
        } else {
          await FirebaseAuth.instance
              .signOut(); // Sign out user if email is not verified
          log("Please verify your email before signing in.");
          return "Please verify your email before signing in.";
        }
      } else {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log("User not found");
        return "User not found";
      } else if (e.code == 'wrong-password') {
        log("Wrong Password");

        return "Wrong password";
      } else {
        log("Sign in failed. Please try again later.");
        return "Sign in failed. Please try again later.";
      }
    } catch (e) {
      log("An error occurred. Please try again later.");
      return "An error occurred. Please try again later.";
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
