import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdmProfile extends StatelessWidget {
  const AdmProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.0,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.4),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 40,
            child: Text(
              "Profile",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Muhammad Fulan S.Pd",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.openSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Staff UNCP",
                style: GoogleFonts.openSans(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                "12345678 - NIP",
                style: GoogleFonts.openSans(
                  fontSize: 14,
                  color: Colors.grey,
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
