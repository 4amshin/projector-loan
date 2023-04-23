// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdmDeleteButton extends StatelessWidget {
  final void Function()? onTap;
  const AdmDeleteButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: SvgPicture.asset(
          'assets/icons/trash.svg',
          height: 20,
          colorFilter: const ColorFilter.mode(
            Colors.redAccent,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
