// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StEditButton extends StatelessWidget {
  final void Function()? onTap;
  const StEditButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.amber,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 40,
        width: 40,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.amberAccent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SvgPicture.asset(
          'assets/icons/edit-2.svg',
          colorFilter: const ColorFilter.mode(
            Colors.black,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
