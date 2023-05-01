import 'dart:developer';

import 'package:projector_loan/core.dart';

class AdmLcdDataController extends State<AdmLcdDataView>
    implements MvcController {
  static late AdmLcdDataController instance;
  late AdmLcdDataView view;

  @override
  void initState() {
    instance = this;
    log("Lcd List Page");
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  //data lcd Stream
  Stream<QuerySnapshot<Map<String, dynamic>>> dataLcdStream() {
    return FirebaseFirestore.instance
        .collection("data_lcd")
        .orderBy('lcd_name')
        .snapshots();
  }

  //add data
  lcdInputForm() {
    log("Navigate to Lcd Input Form");
    Get.to(const AdmLcdDataFormView());
  }

  //edit data
  lcdEditForm({required LCDData item}) {
    log("Navigate to Lcd Edit Form");
    Get.to(
      AdmLcdDataFormView(
        item: item,
      ),
    );
  }
}
