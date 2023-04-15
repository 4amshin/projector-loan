import 'package:flutter/material.dart';
import 'package:projector_loan/state_util.dart';
import '../view/st_history_view.dart';

class StHistoryController extends State<StHistoryView>
    implements MvcController {
  static late StHistoryController instance;
  late StHistoryView view;

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
