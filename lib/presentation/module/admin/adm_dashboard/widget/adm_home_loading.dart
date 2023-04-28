import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projector_loan/presentation/shared/widget/loading/build_shimmer.dart';

class AdmHomeLoading extends StatelessWidget {
  const AdmHomeLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildShimmer(
          child: Container(
            height: 130.0,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, top: 20),
          child: Text(
            "Kategori",
            style: GoogleFonts.openSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.only(top: 10),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.8,
            ),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return buildShimmer(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
