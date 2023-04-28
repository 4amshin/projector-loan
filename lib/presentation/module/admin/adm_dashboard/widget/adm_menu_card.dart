// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:projector_loan/core.dart';

class AdmMenuCard extends StatelessWidget {
  final String title;
  final String icon;
  final String total;
  const AdmMenuCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.total,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.openSans(
              height: 1,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Center(
            child: SvgPicture.network(
              icon,
              height: 60,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                total,
                style: GoogleFonts.openSans(
                  height: 1,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Total Request",
                style: GoogleFonts.openSans(
                  height: 1,
                  fontSize: 12.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
