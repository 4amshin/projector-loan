import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:projector_loan/state_util.dart';
import '../view/st_history_view.dart';

class StHistoryController extends State<StHistoryView>
    implements MvcController {
  static late StHistoryController instance;
  late StHistoryView view;

  @override
  void initState() {
    instance = this;
    initializeDateFormatting('id_ID', null);
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  final currentUser = FirebaseAuth.instance.currentUser!;
}
