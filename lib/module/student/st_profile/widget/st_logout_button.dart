// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class StLogoutButton extends StatelessWidget {
  final void Function()? onTap;
  const StLogoutButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          focusColor: Colors.indigo,
          splashColor: Colors.red,
          borderRadius: BorderRadius.circular(18),
          child: Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  offset: const Offset(1, 6),
                  blurRadius: 10,
                ),
              ],
            ),
            child: const Icon(
              Icons.logout_rounded,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
