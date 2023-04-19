import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projector_loan/module/student/st_home/widget/st_mid_content_card.dart';

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
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return StMidContentCard(
                title: "$index",
              );
            },
          ),
        ),
      ],
    );
  }
}
