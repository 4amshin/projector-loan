// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:projector_loan/module/admin/adm_lcd_loans/widget/card_button.dart';

class StLoanStatusCard extends StatelessWidget {
  final String lcdName;
  final String dayTime;
  final String hourTime;
  const StLoanStatusCard({
    Key? key,
    required this.lcdName,
    required this.dayTime,
    required this.hourTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 87,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            offset: const Offset(2, 3),
            blurRadius: 4,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/icons/lcd.svg',
                height: 40,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lcdName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.openSans(
                        height: 1,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Hari: $dayTime\nJam: $hourTime',
                      maxLines: 2,
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
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: CardButton(
              onTap: () {},
              height: 35,
              width: MediaQuery.of(context).size.width,
              label: 'Batalkan Request',
              labelSize: 14,
              backgroundColor: Colors.redAccent.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }
}
