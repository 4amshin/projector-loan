// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:projector_loan/presentation/shared/widget/cached_image/cached_image.dart';

class StTopProfileCard extends StatelessWidget {
  final String imgUrl;
  final String name;
  const StTopProfileCard({
    Key? key,
    required this.imgUrl,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                "assets/icons/uncp-color.svg",
                height: 28,
              ),
              CircleAvatar(
                backgroundColor: Colors.grey.withOpacity(0.5),
                radius: 18,
                child: WdCachedImage(
                  imgUrl: imgUrl,
                  size: 40,
                  borderRadius: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi, ",
                    style: GoogleFonts.openSans(
                      fontSize: 25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "$name!",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.openSans(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                "Selamat Bergabung di Aplikasi Layanan Peminjaman Proyector LCD Kampus",
                style: GoogleFonts.openSans(
                  height: 1.2,
                  fontSize: 14,
                  color: Colors.grey[400],
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
