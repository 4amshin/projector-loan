import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projector_loan/state_util.dart';

dialogButton({
  required String label,
  final Color? labelColor,
  final Color? backgroundColor,
  final void Function()? onTap,
}) {
  return Expanded(
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: backgroundColor ?? Colors.blueGrey,
      ),
      onPressed: onTap,
      child: Text(
        label,
        style: GoogleFonts.openSans(
          color: labelColor ?? Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}

Future confirmationDialog({
  required String message,
  final void Function()? onYes,
  final Color? buttonColor,
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
                        Text(
                          "Konfirmasi",
                          style: GoogleFonts.openSans(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          message,
                          style: GoogleFonts.openSans(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            dialogButton(
                              label: 'Tidak',
                              labelColor: Colors.black,
                              backgroundColor: Colors.white,
                              onTap: () => Get.back(),
                            ),
                            const SizedBox(width: 15),
                            dialogButton(
                              label: 'Ya',
                              backgroundColor: buttonColor ?? Colors.redAccent,
                              onTap: onYes,
                            ),
                          ],
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
