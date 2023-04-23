import 'dart:developer';

import 'package:projector_loan/core.dart';

class StProfileEditFormController extends State<StProfileEditFormView>
    implements MvcController {
  static late StProfileEditFormController instance;
  late StProfileEditFormView view;

  @override
  void initState() {
    instance = this;
    docId = widget.student.id;
    imgUrl = widget.student.imgUrl;
    name = widget.student.name;
    nim = widget.student.nim;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  //text controller variable
  String? docId;
  String? imgUrl;
  String? name;
  String? nim;

  saveStudentData() async {
    await AuthService.updateStudentData(
      docId: docId!,
      imgUrl: imgUrl!,
      name: name!,
      nim: nim!,
    );
    log("Saving Edited Profile Data\nImgUrl: $imgUrl, \nName: $name, \nNIM: $nim");
    await showInfoDialog(
      label: 'Tersimpan',
      message: 'Data anda tersimpan',
    );
    Get.back();
  }
}
