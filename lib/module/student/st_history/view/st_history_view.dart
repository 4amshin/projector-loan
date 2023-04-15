import 'package:flutter/material.dart';
import 'package:projector_loan/core.dart';
import '../controller/st_history_controller.dart';

class StHistoryView extends StatefulWidget {
  const StHistoryView({Key? key}) : super(key: key);

  Widget build(context, StHistoryController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("StHistory"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<StHistoryView> createState() => StHistoryController();
}
