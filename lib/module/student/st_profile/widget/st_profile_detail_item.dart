// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class StProfileDetailItem extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final String iconUrl;
  final void Function()? onTap;
  const StProfileDetailItem({
    Key? key,
    this.title,
    this.subTitle,
    required this.iconUrl,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 35,
                  width: 35,
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blueGrey.withOpacity(0.4),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/$iconUrl',
                  ),
                ),
                const SizedBox(width: 7),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? "Title here",
                      style: GoogleFonts.openSans(
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subTitle ?? "Subtitle Here",
                      style: GoogleFonts.openSans(
                        fontSize: 10.0,
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
