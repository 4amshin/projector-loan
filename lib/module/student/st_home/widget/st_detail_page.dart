// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projector_loan/core.dart';

import 'package:projector_loan/model/loan_term.dart';

class StDetailPage extends StatelessWidget {
  final LoanTerm loanTerm;
  const StDetailPage({
    Key? key,
    required this.loanTerm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(title: loanTerm.title),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
                      fontSize: 16,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      itemText,
                      style: GoogleFonts.openSans(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
