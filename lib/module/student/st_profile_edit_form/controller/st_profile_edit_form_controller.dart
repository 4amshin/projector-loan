import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:projector_loan/module/student/st_profile_edit_form/view/st_profile_edit_form_view.dart';
import 'package:projector_loan/services/auth_services/auth_services.dart';
import 'package:projector_loan/shared/widget/dialog/show_info_dialog.dart';
import 'package:projector_loan/state_util.dart';

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
