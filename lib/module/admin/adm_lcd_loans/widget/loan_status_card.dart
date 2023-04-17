// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:projector_loan/core.dart';
import 'package:projector_loan/module/admin/adm_lcd_loans/widget/card_button.dart';

class LoanStatusCard extends StatelessWidget {
  final String name;
  final String nim;
  final String lcdName;
  final String imgUrl;
  const LoanStatusCard({
    Key? key,
    required this.name,
    required this.nim,
    required this.lcdName,
    required this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            offset: const Offset(2, 3),
            blurRadius: 3,
          ),
        ],
      ),
      child: Row(
        children: [
          WdCachedImage(
            size: 65,
            imgUrl: imgUrl,
            borderRadius: 15,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.openSans(
                        height: 1,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      nim,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.openSans(
                        fontSize: 13.0,
                        color: Colors.grey[400],
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Text(
                  "Request: $lcdName",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.openSans(
                    fontSize: 12,
                    color: Colors.indigoAccent.withOpacity(0.8),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardButton(
                onTap: () {},
                label: 'Terima',
                labelColor: Colors.black,
                backgroundColor: Colors.greenAccent,
              ),
              CardButton(
                onTap: () {},
                label: 'Tolak',
                labelColor: Colors.black,
                backgroundColor: Colors.redAccent,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
