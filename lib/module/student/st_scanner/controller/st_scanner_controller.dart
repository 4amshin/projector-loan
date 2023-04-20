import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projector_loan/module/student/st_lcd_detail/view/st_lcd_detail_view.dart';
import 'package:projector_loan/module/student/st_main_navigation/view/st_main_navigation_view.dart';
import 'package:projector_loan/module/student/st_scanner/view/st_scanner_view.dart';
import 'package:projector_loan/state_util.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class StScannerController extends State<StScannerView>
    implements MvcController {
  static late StScannerController instance;
  late StScannerView view;

  @override
  void initState() {
    instance = this;
    log("QR Code Scan Page");
    super.initState();
  }

  @override
  void dispose() {
    qrController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? qrController;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      qrController!.pauseCamera();
    } else if (Platform.isIOS) {
      qrController!.resumeCamera();
    }
  }

  String? scannedData;
  bool isButtonEnabled = false;

  void onQRViewCreated(QRViewController qrController) {
    this.qrController = qrController;
    qrController.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        log("Scanned Data: ${scanData.code}");
        isButtonEnabled = true;
        scannedData = scanData.code;
      });
    });
  }

  void scanQrCode() {
    log("Scanning......");
    //navigate to LCD detail page for loan operation
    Get.offAll(StLcdDetailView(scannedData: scannedData!));
    // Get.to(
    //   StLcdDetailView(scannedData: scannedData!),
    // );
  }

  //ask camera permission
  void onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  bool isLightOn = false;

  //Turn on Flash Light
  toggleFlash() async {
    await qrController?.toggleFlash();
    isLightOn = !isLightOn;
    setState(() {});
    log("Flash Light Status : $isLightOn");
  }

  //Flip the camera
  flipCamera() async {
    await qrController?.flipCamera();
    setState(() {});
  }

  //pause camera scanner
  pauseCamera() async {
    await qrController?.pauseCamera();
    // setState(() {});
  }

  backToHomePage() {
    log("Back to Home Page");
    Get.offAll(const StMainNavigationView());
  }
}
