// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LcdDetailTopContent extends StatelessWidget {
  final String title;
  const LcdDetailTopContent({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SvgPicture.asset(
            'assets/icons/projector.svg',
            height: 130,
            colorFilter: const ColorFilter.mode(
              Colors.amber,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: GoogleFonts.openSans(
              fontSize: 16.5,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
