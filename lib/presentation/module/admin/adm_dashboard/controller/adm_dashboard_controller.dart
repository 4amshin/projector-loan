import 'dart:developer';

import 'package:projector_loan/core.dart';

class AdmDashboardController extends State<AdmDashboardView>
    implements MvcController {
  static late AdmDashboardController instance;
  late AdmDashboardView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  final currentUser = FirebaseAuth.instance.currentUser!;

  //get admin data stream
  Stream<QuerySnapshot<Map<String, dynamic>>> adminDataStream() {
    return FirebaseFirestore.instance
        .collection('admin_data')
        .where('email', isEqualTo: currentUser.email)
        .snapshots();
  }

  //get admin home category data stream
  Stream<QuerySnapshot<Map<String, dynamic>>> adminHomeCategoryStream() {
    return FirebaseFirestore.instance
        .collection('admin_home_category')
        .snapshots();
  }

  doAdminLogout() {
    confirmationDialog(
      message: 'Kamu yakin ingin Logout?',
      onYes: () {
        log("Admin Exit");
        Get.offAll(const LoginView());
      },
    );
  }
}
