// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StBorrowButton extends StatelessWidget {
  final void Function()? onTap;
  const StBorrowButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: 80,
      child: FloatingActionButton(
        backgroundColor: Colors.indigoAccent[100],
        onPressed: onTap,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        elevation: 3,
        child: Text(
          "Pinjam",
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
