import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class StTopProfileLoading extends StatelessWidget {
  const StTopProfileLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final circleAvatar = _buildShimmer(
      const CircleAvatar(radius: 20),
    );

    final smallBox = _buildShimmer(
      Container(
        height: 10,
        width: 40,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );

    final largeBox = _buildShimmer(
      Container(
        height: 15,
        width: 150,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );

    return Row(
      children: [
        circleAvatar,
        const SizedBox(width: 10),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            smallBox,
            const SizedBox(height: 4),
            largeBox,
          ],
        ),
      ],
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
