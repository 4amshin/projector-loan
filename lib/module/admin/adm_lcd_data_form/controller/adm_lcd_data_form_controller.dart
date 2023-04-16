import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:projector_loan/core.dart';
import 'package:projector_loan/services/lcd_services/lcd_service.dart';
import 'package:projector_loan/shared/widget/dialog/confirmation_dialog.dart';
import 'package:projector_loan/state_util.dart';
import '../view/adm_lcd_data_form_view.dart';

class AdmLcdDataFormController extends State<AdmLcdDataFormView>
    implements MvcController {
  static late AdmLcdDataFormController instance;
  late AdmLcdDataFormView view;

  @override
  void initState() {
    instance = this;
    if (isEditMode) {
      docId = widget.item!["id"];
      lcdId = widget.item!["lcd_id"];
      lcdName = widget.item!["lcd_name"];
      lcdBrand = widget.item!["brand"];
      resolution = widget.item!["resolution"];
      weight = widget.item!["weight"];
      port = widget.item!["port"];
      status = widget.item!["status"];

      qrCodeData = widget.item!["lcd_id"];
    }
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  bool get isEditMode {
    return widget.item != null;
  }

  String? docId;
  String? lcdId;
  String? lcdName;
  String? lcdBrand;
  String? resolution;
  String? weight;
  String? port;
  String? status;

  String qrCodeData = 'data';

  doSaveData() async {
    if (isEditMode) {
      await confirmationDialog(
          message: 'Simpan Perubahan?',
          onYes: () async {
            await LcdService.updateData(
              docId: docId!,
              lcdId: lcdId!,
              lcdName: lcdName!,
              lcdBrand: lcdBrand!,
              resolution: resolution!,
              weight: weight!,
              port: port!,
              status: status!,
            );
            Get.back();
          });
      log("Edit Data");
    } else {
      //else await add new data
      await LcdService.addData(
        lcdId: lcdId!,
        lcdName: lcdName!,
        lcdBrand: lcdBrand!,
        resolution: resolution!,
        weight: weight!,
        port: port!,
      );
      await showInfoDialog(message: 'Data Proyektor Ditambahkan');
      log("New Data Added");
    }
    //Assigned lcdid to be a qr image
    qrCodeData = lcdId!;
    log("Lcd Data = $qrCodeData");
    Get.back();
  }

  deleteData() async {
    await confirmationDialog(
      message: 'Hapus Data',
      onYes: () async {
        await LcdService.deleteData(docId: docId!);
        log("Data Deleted....\nNavigate Back");
        Get.back();
      },
    );
    Get.back();
  }
}
