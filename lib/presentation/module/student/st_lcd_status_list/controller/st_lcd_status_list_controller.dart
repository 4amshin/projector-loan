import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projector_loan/state_util.dart';
import '../view/st_lcd_status_list_view.dart';

class StLcdStatusListController extends State<StLcdStatusListView>
    implements MvcController {
  static late StLcdStatusListController instance;
  late StLcdStatusListView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  //data lcd stream
  Stream dataLcdStream({required String status}) {
    return FirebaseFirestore.instance
        .collection("data_lcd")
        .where("status", isEqualTo: status)
        .where("status")
        .snapshots();
  }
}
