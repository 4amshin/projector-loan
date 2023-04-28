import 'package:flutter/material.dart';
import 'package:projector_loan/presentation/shared/widget/loading/build_shimmer.dart';

class AdmHomeCategoryLoading extends StatelessWidget {
  const AdmHomeCategoryLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        );
      },
    );
  }
}
