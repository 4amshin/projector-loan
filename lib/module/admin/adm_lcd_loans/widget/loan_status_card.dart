// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:projector_loan/core.dart';
import 'package:projector_loan/module/admin/adm_lcd_loans/widget/card_button.dart';

class LoanStatusCard extends StatelessWidget {
  final String name;
  final String nim;
  final String lcdName;
  final String imgUrl;
  final bool requestButton;
  final void Function()? onAccept;
  final void Function()? onReject;
  final bool returnedButton;
  final void Function()? onReturn;
  final bool isRequest;
  final bool isReturned;
  const LoanStatusCard({
    Key? key,
    required this.name,
    required this.nim,
    required this.lcdName,
    required this.imgUrl,
    this.requestButton = false,
    this.onAccept,
    this.onReject,
    this.returnedButton = false,
    this.onReturn,
    this.isRequest = false,
    this.isReturned = false,
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
              WdCachedImage(
                size: 65,
                imgUrl: imgUrl,
                borderRadius: 15,
              ),
              const SizedBox(width: 10),
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
                    Row(
                      children: [
                        Text(
                          lcdName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.openSans(
                            fontSize: 12,
                            color: Colors.indigoAccent.withOpacity(0.8),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        returnedButton == false && isReturned
                            ? Text(
                                isReturned
                                    ? ' | Telah Dikembalikan'
                                    : ' | Sedang Digunakan',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.openSans(
                                  fontSize: 12,
                                  color: isReturned
                                      ? Colors.green.withOpacity(0.8)
                                      : Colors.indigoAccent.withOpacity(0.8),
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            : const SizedBox(),
                        if (isReturned)
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: SvgPicture.asset(
                              'assets/icons/check-circle.svg',
                              height: 18,
                              colorFilter: ColorFilter.mode(
                                Colors.green.withOpacity(0.8),
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              if (requestButton)
                Column(
                  children: [
                    CardButton(
                      onTap: onAccept,
                      label: 'Terima',
                      labelColor: Colors.black,
                      backgroundColor: Colors.greenAccent.withOpacity(0.8),
                    ),
                    const SizedBox(height: 10),
                    CardButton(
                      onTap: onReject,
                      label: 'Tolak',
                      labelColor: Colors.black,
                      backgroundColor: Colors.redAccent.withOpacity(0.8),
                    ),
                  ],
                ),
            ],
          ),
          if (returnedButton)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CardButton(
                onTap: onReturn,
                height: 35,
                width: MediaQuery.of(context).size.width,
                label: 'Konfirmasi Pengembalian',
                labelSize: 14,
              ),
            ),
        ],
      ),
    );
  }
}
