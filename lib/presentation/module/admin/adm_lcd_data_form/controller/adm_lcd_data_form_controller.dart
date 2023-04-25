import 'dart:developer';

import 'package:projector_loan/core.dart';

class AdmLcdDataFormController extends State<AdmLcdDataFormView>
    implements MvcController {
  static late AdmLcdDataFormController instance;
  late AdmLcdDataFormView view;

  @override
  void initState() {
    instance = this;
    if (isEditMode) {
      lcdId = widget.item?.lcdId;
      lcdName = widget.item?.lcdName;
      lcdBrand = widget.item?.lcdBrand;
      resolution = widget.item?.lcdResolution;
      weight = widget.item?.lcdWeight;
      port = widget.item?.lcdPorts;
      status = widget.item?.lcdStatus;

      qrCodeData = widget.item!.lcdId;
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
        await LcdService.deleteData(lcdId: lcdId!);
        log("Data Deleted....\nNavigate Back");
        Get.back();
      },
    );
    Get.back();
  }
}
