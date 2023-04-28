import 'package:flutter/material.dart';
import 'package:projector_loan/presentation/shared/widget/loading/build_shimmer.dart';

class AdmProfileCardLoading extends StatelessWidget {
  const AdmProfileCardLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildShimmer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildShimmer(
            child: const CircleAvatar(radius: 40),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildShimmer(
                  child: Container(
                    height: 23,
                    margin: const EdgeInsets.symmetric(vertical: 3),
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
                buildShimmer(
                  child: Container(
                    height: 15,
                    margin: const EdgeInsets.symmetric(vertical: 3),
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
                buildShimmer(
                  child: Container(
                    height: 15,
                    margin: const EdgeInsets.symmetric(vertical: 3),
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
