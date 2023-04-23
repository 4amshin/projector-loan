// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardButton extends StatelessWidget {
  final void Function()? onTap;
  final String label;
  final double? labelSize;
  final Color? labelColor;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  const CardButton({
    Key? key,
    this.onTap,
    required this.label,
    this.labelSize,
    this.labelColor,
    this.backgroundColor,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 30,
      width: width ?? 80,
      child: FilledButton(
        onPressed: onTap,
        style: FilledButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.greenAccent,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(15)),
        ),
        child: Text(
          label,
          style: GoogleFonts.openSans(
            fontSize: labelSize ?? 13,
            color: labelColor ?? Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
