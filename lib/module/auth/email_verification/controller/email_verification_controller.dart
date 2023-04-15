import 'package:flutter/material.dart';
import 'package:projector_loan/state_util.dart';
import '../view/email_verification_view.dart';

class EmailVerificationController extends State<EmailVerificationView> implements MvcController {
  static late EmailVerificationController instance;
  late EmailVerificationView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}