import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projector_loan/core.dart';
import 'package:projector_loan/module/student/st_history/widget/st_loan_status.dart';

class StHistoryView extends StatefulWidget {
  const StHistoryView({Key? key}) : super(key: key);

  Widget build(context, StHistoryController controller) {
    controller.view = this;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          centerTitle: true,
          title: const AppBarTitle(
            title: 'Peminjaman LCD',
            color: Colors.white,
          ),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.indigo,
            labelColor: Colors.white,
            labelStyle: GoogleFonts.openSans(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: GoogleFonts.openSans(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            unselectedLabelColor: Colors.white54,
            tabs: const [
              Tab(
                text: "Request",
              ),
              Tab(
                text: "Sedang Digunakan",
              ),
              Tab(
                text: "Riwayat",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            StLoanStatus(
              status: 'Request',
              cancelRequest: true,
            ),
            StLoanStatus(
              status: 'OnUse',
              returnedRequest: true,
            ),
            StLoanStatus(status: 'Returned'),
          ],
        ),
      ),
    );
  }

  @override
  State<StHistoryView> createState() => StHistoryController();
}
