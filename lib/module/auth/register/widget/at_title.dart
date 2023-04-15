// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AtTitle extends StatelessWidget {
  final String? title;
  final String? content;
  const AtTitle({
    Key? key,
    this.title,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title ?? "Registrasi",
          style: GoogleFonts.openSans(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          content ?? "Daftarkan diri anda",
          style: GoogleFonts.openSans(
            fontSize: 13,
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
