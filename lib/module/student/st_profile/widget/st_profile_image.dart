// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projector_loan/module/student/st_profile/widget/st_edit_button.dart';
import 'package:projector_loan/shared/widget/cached_image/cached_image.dart';

class StProfileImage extends StatelessWidget {
  final String? imgUrl;
  final String? name;
  final String? nim;
  final void Function()? onEdit;
  const StProfileImage({
    Key? key,
    this.imgUrl,
    this.name,
    this.nim,
    this.onEdit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35, bottom: 25),
      child: Center(
        child: Column(
          children: [
            Stack(
              children: [
                WdCachedImage(
                  imgUrl: imgUrl,
                  size: 130,
                  borderRadius: 45,
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: StEditButton(
                    onTap: onEdit,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              name ?? "Nama Lengkap",
              style: GoogleFonts.openSans(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              nim ?? "NIM 10 Digit",
              style: GoogleFonts.openSans(
                fontSize: 13,
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
