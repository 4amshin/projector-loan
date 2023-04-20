import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projector_loan/core.dart';
import 'package:projector_loan/model/loan_term.dart';
import 'package:projector_loan/module/student/st_home/widget/st_mid_content_card.dart';
import 'package:projector_loan/shared/widget/dialog/show_big_info.dart';

class StMidContent extends StatelessWidget {
  const StMidContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text(
            "Aturan",
            style: GoogleFonts.openSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 330,
          // color: Colors.red,
          child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("loan_term").snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              final loanTerms = snapshot.data!.docs
                  .map((doc) => LoanTerm.fromFirestore(doc))
                  .toList();

              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: loanTerms.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final loanTerm = loanTerms[index];

                  return StMidContentCard(
                    title: loanTerm.title,
                    color: Color(int.parse("0xff${loanTerm.color}")),
                    onTap: () async {
                      showBigInfo(loanTerm: loanTerm);
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
