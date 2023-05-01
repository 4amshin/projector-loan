import 'dart:developer';

import 'package:projector_loan/core.dart';

class StHomeController extends State<StHomeView> implements MvcController {
  static late StHomeController instance;
  late StHomeView view;

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

  //students stream
  Stream<Student> studentsStream() {
    return FirebaseFirestore.instance
        .collection('students')
        .where("email", isEqualTo: currentUser.email)
        .snapshots()
        .map((snapshot) => Student.fromFirestore(snapshot.docs.first));
  }

  //loan term stream
  Stream loanTermStream() {
    return FirebaseFirestore.instance.collection("loan_term").snapshots();
  }

  scanQrCode() {
    Get.to(const StScannerView());
  }

  toLcdStatusPage() {
    log("Navigate to Lcd Status Page");
    Get.to(const StLcdStatusListView());
  }
}
