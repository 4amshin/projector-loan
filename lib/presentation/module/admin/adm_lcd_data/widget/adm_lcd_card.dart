// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AdmLcdCard extends StatelessWidget {
  final String lcdName;
  final String lcdBrand;
  final String status;
  final void Function()? onTap;
  const AdmLcdCard({
    Key? key,
    required this.lcdName,
    required this.lcdBrand,
    required this.status,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 85,
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              offset: const Offset(2, 3),
              blurRadius: 3,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/projector.svg',
                  height: 40,
                  colorFilter: ColorFilter.mode(
                    Colors.indigoAccent[100]!,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          lcdName,
                          style: GoogleFonts.openSans(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        CircleAvatar(
                          radius: 4,
                          backgroundColor: status == "Tersedia"
                              ? Colors.greenAccent
                              : status == "Dipakai"
                                  ? Colors.yellowAccent
                                  : Colors.redAccent,
                        ),
                      ],
                    ),
                    Text(
                      lcdBrand,
                      style: GoogleFonts.openSans(
                        fontSize: 13.5,
                        color: Colors.grey,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.grey,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
