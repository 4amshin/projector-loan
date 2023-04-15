// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:projector_loan/module/student/st_lcd_detail/widget/st_column_item.dart';

class LcdDetailColumn extends StatelessWidget {
  final String brand;
  final String resolution;
  final String weight;
  final String port;
  const LcdDetailColumn({
    Key? key,
    required this.brand,
    required this.resolution,
    required this.weight,
    required this.port,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StColumnItem(
          title: 'Merek',
          content: brand,
        ),
        StColumnItem(
          title: 'Resolusi',
          content: resolution,
        ),
        StColumnItem(
          title: 'Berat',
          content: weight,
        ),
        StColumnItem(
          title: 'Port',
          content: port,
        ),
      ],
    );
  }
}
