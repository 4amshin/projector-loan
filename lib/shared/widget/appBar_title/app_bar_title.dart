import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarTitle extends StatelessWidget {
  final String title;
  final Color? color;
  const AppBarTitle({
    Key? key,
    required this.title,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.openSans(
        fontSize: 18,
        color: color ?? Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
