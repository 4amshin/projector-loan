import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projector_loan/data/model/loan_term_model.dart';
import 'package:projector_loan/presentation/shared/widget/dialog/dialog_button.dart';
import 'package:projector_loan/state_util.dart';

Future showBigInfo({
  final String? label,
  required LoanTerm loanTerm,
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
              width: MediaQuery.of(context).size.width * 0.8,
              child: Wrap(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            loanTerm.title,
                            style: GoogleFonts.openSans(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.35,
                          child: ListView.builder(
                            itemCount: loanTerm.list.length,
                            itemBuilder: (context, index) {
                              final itemText = loanTerm.list[index];
                              final itemNumber = index + 1;

                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '$itemNumber. ',
                                      style: GoogleFonts.openSans(
                                        fontSize: 13,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        itemText,
                                        style: GoogleFonts.openSans(
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            dialogButton(
                              label: 'Ok',
                              labelColor: Colors.black,
                              onTap: () => Get.back(),
                              backgroundColor: const Color(0xff5cd89b),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
              .animate()
              .fade(
                duration: 400.ms,
              )
              .slideY(
                begin: 0.5,
                duration: 400.ms,
                curve: Curves.easeInOut,
              ),
        ),
      );
    },
  );
}
