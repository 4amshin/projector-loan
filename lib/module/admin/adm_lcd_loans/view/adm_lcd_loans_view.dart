import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projector_loan/core.dart';
import 'package:projector_loan/module/admin/adm_lcd_loans/widget/adm_loan_status.dart';
import '../controller/adm_lcd_loans_controller.dart';

class AdmLcdLoansView extends StatefulWidget {
  const AdmLcdLoansView({Key? key}) : super(key: key);

  Widget build(context, AdmLcdLoansController controller) {
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
                text: "Di Kembalikan",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AdmLoanStatus(
              status: 'Request',
              displayRequestButton: true,
              acceptRequest: true,
            ),
            AdmLoanStatus(
              status: 'OnUse',
              displayReturnedButton: true,
            ),
            AdmLoanStatus(
              status: 'Returned',
              isReturned: true,
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<AdmLcdLoansView> createState() => AdmLcdLoansController();
}
