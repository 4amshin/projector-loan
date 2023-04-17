import 'package:flutter/material.dart';
import 'package:projector_loan/state_util.dart';
import '../view/adm_lcd_loans_view.dart';

class AdmLcdLoansController extends State<AdmLcdLoansView> implements MvcController {
  static late AdmLcdLoansController instance;
  late AdmLcdLoansView view;

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