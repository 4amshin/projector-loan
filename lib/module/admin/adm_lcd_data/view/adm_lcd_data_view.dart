import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projector_loan/module/admin/adm_lcd_data/widget/adm_add_button.dart';
import 'package:projector_loan/module/admin/adm_lcd_data/widget/adm_lcd_card.dart';
import 'package:projector_loan/shared/widget/appBar_title/app_bar_title.dart';
import '../controller/adm_lcd_data_controller.dart';

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
            return const Center(child: Text('No Data'));
          }

          final data = snapshot.data!;
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: data.docs.length,
            itemBuilder: (context, index) {
              final item = data.docs[index].data();
              item["id"] = data.docs[index].id;
              String lcdName = item["lcd_name"];
              String lcdBrand = item["brand"];
              String lcdStatus = item["status"];
              return AdmLcdCard(
                lcdBrand: lcdBrand,
                lcdName: lcdName,
                status: lcdStatus,
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
