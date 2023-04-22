import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projector_loan/core.dart';
import 'package:projector_loan/model/student_model.dart';

class StProfileStream extends StatelessWidget {
  const StProfileStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StProfileController controller = StProfileController.instance;

    return StreamBuilder<Student>(
      stream: FirebaseFirestore.instance
          .collection('students')
          .where("email", isEqualTo: controller.currentUser.email)
          .snapshots()
          .map((snapshot) => Student.fromFirestore(snapshot.docs.first)),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const StProfileViewLoading();
        }

        final student = snapshot.data!;

        return StProfileImage(
          imgUrl: student.imgUrl,
          name: student.name,
          nim: student.nim,
          onEdit: () => controller.toEditProfile(student: student),
        );
      },
    );
  }
}
