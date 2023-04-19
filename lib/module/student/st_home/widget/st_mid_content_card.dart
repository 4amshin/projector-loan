// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StMidContentCard extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const StMidContentCard({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(left: 25, top: 25, bottom: 25),
        decoration: BoxDecoration(
          color: Colors.indigoAccent,
          borderRadius: BorderRadius.circular(30),
          image: const DecorationImage(
            image: AssetImage('assets/images/motif.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Color.fromARGB(255, 123, 143, 251),
              BlendMode.srcIn,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: const Offset(5, 10),
              blurRadius: 10,
              spreadRadius: 2,
              // spreadRadius: 2,
            ),
          ],
        ),
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.openSans(
              height: 1,
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
