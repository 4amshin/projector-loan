// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'dart:async';

class ShowSnackBar {
  static Future<void> show(
    BuildContext context, {
    String? label,
    required String message,
    Color? backgroundColor,
  }) {
    Completer<void> completer = Completer<void>();

    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
      backgroundColor: backgroundColor ?? Colors.redAccent,
      action: SnackBarAction(
        label: label ?? '',
        onPressed: () {
          completer.complete();
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    return completer.future;
  }
}
