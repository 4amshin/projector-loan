// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:projector_loan/core.dart';

class StLcdDetailCard extends StatelessWidget {
  final String lcdName;
  final String brand;
  final String resolution;
  final String weight;
  final String port;
  const StLcdDetailCard({
    Key? key,
    required this.lcdName,
    required this.brand,
    required this.resolution,
    required this.weight,
    required this.port,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ListView(
        children: [
          const SizedBox(height: 20),
          LcdDetailTopContent(title: lcdName),
          const SizedBox(height: 30),
          LcdDetailColumn(
            brand: brand,
            resolution: resolution,
            weight: weight,
            port: port,
          ),
        ],
      ),
    );
  }
}
