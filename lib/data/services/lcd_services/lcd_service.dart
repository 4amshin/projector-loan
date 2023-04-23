import 'package:cloud_firestore/cloud_firestore.dart';

class LcdService {
  static addData({
    required String lcdId,
    required String lcdName,
    required String lcdBrand,
    required String resolution,
    required String weight,
    required String port,
  }) async {
    await FirebaseFirestore.instance.collection("data_lcd").add({
      "lcd_id": lcdId,
      "lcd_name": lcdName,
      "brand": lcdBrand,
      "resolution": resolution,
      "weight": weight,
      "port": port, //ex: HDMI, VGA
      "status": "Tersedia", //ex: Tersedia, Sedang Pinjam, Rusak
    });
  }

  static updateData({
    required String docId,
    required String lcdId,
    required String lcdName,
    required String lcdBrand,
    required String resolution,
    required String weight,
    required String port,
    required String status,
  }) async {
    await FirebaseFirestore.instance.collection("data_lcd").doc(docId).update({
      "lcd_id": lcdId,
      "lcd_name": lcdName,
      "brand": lcdBrand,
      "resolution": resolution,
      "weight": weight,
      "port": port,
      "status": status //option style, - Tersedia, Rusak, Sedang Dipinjam
    });
  }

  static deleteData({
    required String docId,
  }) async {
    await FirebaseFirestore.instance.collection("data_lcd").doc(docId).delete();
  }
}
