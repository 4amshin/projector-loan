// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projector_loan/shared/widget/cached_image/cached_image.dart';

class StTopProfile extends StatelessWidget {
  final String? imgUrl;
  final String? name;
  const StTopProfile({
    Key? key,
    this.imgUrl,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        WdCachedImage(
          imgUrl: imgUrl,
          size: 40,
          borderRadius: 20,
        ),
        const SizedBox(width: 10),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hai",
              style: GoogleFonts.openSans(
                height: 1,
                fontSize: 13,
                color: Colors.grey[400],
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              name ?? "Your Name Here",
              style: GoogleFonts.openSans(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
