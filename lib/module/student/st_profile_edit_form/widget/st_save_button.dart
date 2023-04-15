// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StSaveButton extends StatelessWidget {
  final void Function() onTap;
  const StSaveButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 35,
      child: FloatingActionButton(
        onPressed: onTap,
        backgroundColor: Colors.indigoAccent[100],
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Text(
          "Simpan",
          style: GoogleFonts.openSans(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
