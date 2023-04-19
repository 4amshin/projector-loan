import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projector_loan/core.dart';

class StProfileStream extends StatelessWidget {
  const StProfileStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StProfileController controller = StProfileController.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    return StreamBuilder<QuerySnapshot>(
      stream: firestore
          .collection('students')
          .where("email", isEqualTo: controller.currentUser.email)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const StProfileViewLoading();
        }

        final DocumentSnapshot doc = snapshot.data!.docs.first;
        final String docId = doc.id;
        final String imgUrl = doc.get('foto') as String;
        final String name = doc.get('name') as String;
        final String nim = doc.get('nim') as String;

        return StProfileImage(
          imgUrl: imgUrl,
          name: name,
          nim: nim,
          onEdit: () => controller.toEditProfile(
            docId: docId,
            imgUrl: imgUrl,
            name: name,
            nim: nim,
          ),
        );
      },
    );
  }
}
