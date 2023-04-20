import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projector_loan/core.dart';
import 'package:projector_loan/module/student/st_lcd_status_list/widget/st_lcd_status_card.dart';

class StLcdStatusListView extends StatefulWidget {
  const StLcdStatusListView({Key? key}) : super(key: key);

  Widget build(context, StLcdStatusListController controller) {
    controller.view = this;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: const AppBarTitle(
            title: 'Daftar LCD',
            color: Colors.white,
          ),
          bottom: TabBar(
            // isScrollable: true,
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
                text: "Tersedia",
              ),
              Tab(
                text: "Tidak Tersedia",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            StLcdStatusCard(
              status: "Tersedia",
            ),
            StLcdStatusCard(
              status: "Tidak Tersedia",
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<StLcdStatusListView> createState() => StLcdStatusListController();
}
