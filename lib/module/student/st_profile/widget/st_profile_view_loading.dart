import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class StProfileViewLoading extends StatelessWidget {
  const StProfileViewLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final avatar = _buildShimmer(
      Container(
        height: 130,
        width: 130,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(45),
        ),
      ),
    );

    final nameBox = _buildShimmer(
      Container(
        height: 20,
        margin: const EdgeInsets.symmetric(horizontal: 95),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );

    final titleBox = _buildShimmer(
      Container(
        height: 20,
        margin: const EdgeInsets.symmetric(horizontal: 45),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );

    return Expanded(
      child: ListView(
        children: [
          const SizedBox(height: 35),
          Center(child: avatar),
          const SizedBox(height: 10),
          nameBox,
          const SizedBox(height: 10),
          titleBox,
        ],
      ),
    );
  }

  Widget _buildShimmer(Widget child) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: child,
    );
  }
}
