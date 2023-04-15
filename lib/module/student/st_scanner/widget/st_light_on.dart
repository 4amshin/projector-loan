// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StLightOn extends StatelessWidget {
  final void Function()? onTap;
  final bool isLightOn;
  const StLightOn({
    Key? key,
    this.onTap,
    this.isLightOn = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: SvgPicture.asset(
          'assets/icons/light.svg',
          colorFilter: ColorFilter.mode(
            isLightOn ? Colors.amber : Colors.black,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
