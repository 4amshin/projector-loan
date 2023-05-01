// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:projector_loan/core.dart';
import 'package:projector_loan/presentation/module/student/st_home/widget/st_top_profile_card.dart';

class StTopProfile extends StatelessWidget {
  const StTopProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StHomeController controller = StHomeController.instance;
    return StreamBuilder<Student>(
      stream: controller.studentsStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const StTopProfileLoading();
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Error: ${snapshot.error}"),
          );
        } else if (!snapshot.hasData) {
          return const Center(
            child: Text("No Data"),
          );
        } else {
          final student = snapshot.data!;
          return StTopProfileCard(
            imgUrl: student.imgUrl,
            name: student.name,
          );
        }
      },
    );
  }
}
