import 'package:projector_loan/core.dart';
import 'package:projector_loan/presentation/module/admin/adm_lcd_data/controller/adm_lcd_data_controller.dart';

class AdmLcdDataView extends StatefulWidget {
  const AdmLcdDataView({Key? key}) : super(key: key);

  Widget build(context, AdmLcdDataController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent[100],
        title: const AppBarTitle(
          title: "Daftar LCD",
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("data_lcd")
            .orderBy('lcd_name')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return const NoDataImg();
          }

          final data = snapshot.data!;
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: data.docs.length,
            itemBuilder: (context, index) {
              final item = LCDData.fromFirestoreMap(data.docs[index].data());

              return AdmLcdCard(
                lcdBrand: item.lcdBrand,
                lcdName: item.lcdName,
                status: item.lcdStatus,
                onTap: () => controller.lcdEditForm(item: item),
              );
            },
          );
        },
      ),
      floatingActionButton: AdmAddButton(
        onTap: () => controller.lcdInputForm(),
      ),
    );
  }

  @override
  State<AdmLcdDataView> createState() => AdmLcdDataController();
}
