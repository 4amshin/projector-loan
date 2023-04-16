// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return Container(
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
        top: 20,
        bottom: 30,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.indigoAccent,
            Colors.indigoAccent[100]!,
            // Color(0xffFF8787),
            // Color(0xfffbc3ad),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        // color: Colors.indigoAccent[100],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                "assets/icons/uncp.svg",
                height: 35,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.5),
                radius: 20.5,
                child: WdCachedImage(
                  imgUrl: imgUrl,
                  size: 40,
                  borderRadius: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hi",
                style: GoogleFonts.openSans(
                  height: 1,
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                name ?? "Your Name Here",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.openSans(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Selamat datang di aplikasi layanan peminjaman proyektor lcd kampus",
                style: GoogleFonts.openSans(
                  height: 1,
                  fontSize: 13,
                  color: Colors.white70,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
