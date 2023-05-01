import 'package:projector_loan/core.dart';

class StLcdStatusListView extends StatefulWidget {
  const StLcdStatusListView({Key? key}) : super(key: key);

  Widget build(context, StLcdStatusListController controller) {
    controller.view = this;

    return DefaultTabController(
      length: 3,
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
                text: "DiPakai",
              ),
              Tab(
                text: "Rusak",
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            StLcdStatus(
              status: "Tersedia",
            ),
            StLcdStatus(
              status: "Dipakai",
            ),
            StLcdStatus(
              status: "Rusak",
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<StLcdStatusListView> createState() => StLcdStatusListController();
}
