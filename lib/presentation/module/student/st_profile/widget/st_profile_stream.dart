import 'package:projector_loan/core.dart';

class StProfileStream extends StatelessWidget {
  const StProfileStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StProfileController controller = StProfileController.instance;

    return StreamBuilder<Student>(
      stream: controller.studentsStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const StProfileViewLoading();
        } else if (snapshot.hasError) {
          return Center(
              child: Text('Something went wrong:\n${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return const Center(child: Text('No Data'));
        } else {
          final student = snapshot.data!;

          return StProfileImage(
            imgUrl: student.imgUrl,
            name: student.name,
            nim: student.nim,
            onEdit: () => controller.toEditProfile(student: student),
          );
        }
      },
    );
  }
}
