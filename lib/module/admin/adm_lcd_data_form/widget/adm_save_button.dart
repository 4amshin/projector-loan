// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdmSaveButton extends StatelessWidget {
  final void Function()? onTap;
  const AdmSaveButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 80,
      child: FloatingActionButton(
        backgroundColor: Colors.indigoAccent[100],
        onPressed: onTap,
        child: Text(
          "Save",
          style: GoogleFonts.openSans(
            fontSize: 15.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
