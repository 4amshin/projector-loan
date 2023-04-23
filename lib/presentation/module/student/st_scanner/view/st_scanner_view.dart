import 'package:projector_loan/core.dart';

class StScannerView extends StatefulWidget {
  const StScannerView({Key? key}) : super(key: key);

  Widget build(context, StScannerController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Scan Qr Code",
          style: GoogleFonts.openSans(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () => controller.backToHomePage(),
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        actions: [
          StLightOn(
            onTap: () => controller.toggleFlash(),
            isLightOn: controller.isLightOn,
          ),
        ],
      ),
      body: Stack(
        children: [
          const StBuildQrView(),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: StScanButton(
              onTap: controller.isButtonEnabled
                  ? () => controller.scanQrCode()
                  : null,
            ),
          ),
        ],
      ),
    );
  }

  @override
  State<StScannerView> createState() => StScannerController();
}
