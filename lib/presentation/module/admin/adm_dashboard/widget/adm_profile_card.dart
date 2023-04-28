// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projector_loan/core.dart';

class AdmProfileCard extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String job;
  final String nip;
  const AdmProfileCard({
    Key? key,
    required this.imgUrl,
    required this.name,
    required this.job,
    required this.nip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        WdCachedImage(
          imgUrl: imgUrl,
          borderRadius: 40,
          size: 80,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.openSans(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              job,
              style: GoogleFonts.openSans(
                fontSize: 14,
                color: Colors.black54,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              nip,
              style: GoogleFonts.openSans(
                fontSize: 14,
                color: Colors.black38,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
