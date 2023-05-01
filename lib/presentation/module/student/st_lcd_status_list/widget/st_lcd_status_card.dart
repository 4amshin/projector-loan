// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class StLcdStatusCard extends StatelessWidget {
  final String status;
  final String lcdName;
  const StLcdStatusCard({
    Key? key,
    required this.status,
    required this.lcdName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            offset: const Offset(5, 5),
            blurRadius: 10,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 5,
                backgroundColor: status == "Tersedia"
                    ? Colors.greenAccent
                    : status == "Dipakai"
                        ? Colors.orangeAccent
                        : Colors.redAccent,
              ),
              const SizedBox(width: 5),
              Text(
                status,
                style: GoogleFonts.openSans(
                  fontSize: 10,
                  color: Colors.black45,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Column(
            children: [
              SvgPicture.asset(
                'assets/icons/lcd-box.svg',
                height: 65,
              ),
              const SizedBox(height: 15),
              Text(
                lcdName,
                style: GoogleFonts.openSans(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
