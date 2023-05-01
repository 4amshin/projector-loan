import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdmProfileErrorText extends StatelessWidget {
  const AdmProfileErrorText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Failed Load Data",
        style: GoogleFonts.openSans(
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
