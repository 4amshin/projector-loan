// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AtAccountConfirmation extends StatelessWidget {
  final void Function()? onTap;
  final String? content;
  final String? link;
  const AtAccountConfirmation({
    Key? key,
    this.onTap,
    this.content,
    this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          content ?? "Sudah punya akun? ",
          style: GoogleFonts.openSans(
            fontSize: 13.5,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            link ?? "Login disini",
            style: GoogleFonts.openSans(
              fontSize: 13.5,
              color: Colors.indigo,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
