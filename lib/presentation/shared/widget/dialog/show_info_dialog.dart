import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projector_loan/presentation/shared/widget/dialog/dialog_button.dart';
import 'package:projector_loan/state_util.dart';

Future showInfoDialog({
  final String? label,
  required String message,
}) async {
  await showDialog<void>(
    context: globalContext,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Container(
        color: Colors.black.withOpacity(0.4),
        child: Center(
          child: Card(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Wrap(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/okLogo.svg',
                          height: 80,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          label ?? "Info",
                          style: GoogleFonts.openSans(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          message,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 15),
                        dialogButton(
                          label: 'Ok',
                          onTap: () => Get.back(),
                          backgroundColor: const Color(0xff5cd89b),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ).animate().fade().shake(
                duration: 500.ms,
                hz: 3,
              ),
        ),
      );
    },
  );
}
