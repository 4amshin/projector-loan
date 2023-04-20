import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

dialogButton({
  required String label,
  final Color? labelColor,
  final Color? backgroundColor,
  final void Function()? onTap,
}) {
  return SizedBox(
    height: 35,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        backgroundColor: backgroundColor ?? Colors.blueGrey,
      ),
      onPressed: onTap,
      child: Text(
        label,
        style: GoogleFonts.openSans(
          color: labelColor ?? Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
