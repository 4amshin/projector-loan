// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AtResendButton extends StatelessWidget {
  final void Function()? onResend;
  const AtResendButton({
    Key? key,
    this.onResend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: FilledButton(
        onPressed: onResend,
        style: FilledButton.styleFrom(
          backgroundColor: Colors.indigo,
          shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          "Kirim Ulang",
          style: GoogleFonts.openSans(
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
