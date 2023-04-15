// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AdmAddButton extends StatelessWidget {
  final void Function()? onTap;
  const AdmAddButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.indigoAccent[100],
      onPressed: onTap,
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
