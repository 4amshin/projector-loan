import 'package:projector_loan/core.dart';

class StProfileView extends StatefulWidget {
  const StProfileView({Key? key}) : super(key: key);

  Widget build(context, StProfileController controller) {
    controller.view = this;

    return Scaffold(
      backgroundColor: Colors.blueGrey.withOpacity(0.05),
      body: SafeArea(
        minimum: const EdgeInsets.only(
          left: 25,
          right: 25,
          top: 45,
        ),
        child: ListView(
          children: [
            StLogoutButton(onTap: () => controller.doLogOut()),
            const StProfileStream(),
            const StProfileDetail(),
          ],
        ),
      ),
    );
  }

  @override
  State<StProfileView> createState() => StProfileController();
}
