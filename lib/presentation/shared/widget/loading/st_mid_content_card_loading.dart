// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class StMidContentCardLoading extends StatelessWidget {
  final void Function()? onTap;
  const StMidContentCardLoading({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 200,
          margin: const EdgeInsets.only(left: 25, top: 25, bottom: 25),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(35),
            image: const DecorationImage(
              image: AssetImage('assets/images/motif.png'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.white12,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
