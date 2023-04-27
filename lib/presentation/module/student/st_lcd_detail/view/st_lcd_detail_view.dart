// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:projector_loan/core.dart';

class StLcdDetailView extends StatefulWidget {
  final String scannedData;
  const StLcdDetailView({
    Key? key,
    required this.scannedData,
  }) : super(key: key);

  Widget build(context, StLcdDetailController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(title: "LCD Detail"),
        leading: IconButton(
          onPressed: () => controller.backToScannerPage(),
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: controller.getLcdData().asStream(),
        builder: (context, snapshot) {
          try {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (!snapshot.hasData) {
              return const Center(child: Text('No data available'));
            }

            final doc = snapshot.data!.docs.first;
            final lcdName = doc['lcd_name'] as String?;
            final lcdBrand = doc['brand'] as String?;
            final resolution = doc['resolution'] as String?;
            final weight = doc['weight'] as String?;
            final port = doc['port'] as String?;

            return StLcdDetailCard(
              lcdName: lcdName!,
              brand: lcdBrand!,
              resolution: resolution!,
              weight: weight!,
              port: port!,
            );
          } catch (e) {
            log('Error: $e');
            return const Center(
              child: Text(
                'QRCode LCD Tidak Terdaftar',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: StBorrowButton(
        onTap: () => controller.doLoanLcd(),
      ),
    );
  }

  @override
  State<StLcdDetailView> createState() => StLcdDetailController();
}
