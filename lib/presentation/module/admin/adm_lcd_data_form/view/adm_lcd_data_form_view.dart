// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:projector_loan/presentation/module/admin/adm_lcd_data_form/widget/adm_delete_button.dart';
import 'package:projector_loan/presentation/module/admin/adm_lcd_data_form/widget/adm_save_button.dart';
import 'package:projector_loan/presentation/shared/util/validator/validator.dart';
import 'package:projector_loan/presentation/shared/widget/appBar_title/app_bar_title.dart';
import 'package:projector_loan/presentation/shared/widget/input_field/dropdown.dart';
import 'package:projector_loan/presentation/shared/widget/input_field/q_text_field.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../controller/adm_lcd_data_form_controller.dart';

class AdmLcdDataFormView extends StatefulWidget {
  final Map? item;
  const AdmLcdDataFormView({
    Key? key,
    this.item,
  }) : super(key: key);

  Widget build(context, AdmLcdDataFormController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: controller.isEditMode
            ? const AppBarTitle(title: 'Edit Data')
            : const AppBarTitle(title: 'Add Data'),
        actions: [
          controller.isEditMode
              ? AdmDeleteButton(onTap: () => controller.deleteData())
              : const SizedBox(),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 20.0),
          Center(
            child: QrImage(
              data: controller.qrCodeData,
              version: QrVersions.auto,
              size: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Column(
              children: [
                QTextField(
                  label: "Nama Proyektor",
                  hint: 'Contoh: LCD 00',
                  validator: Validator.required,
                  suffixIcon: Icons.abc_rounded,
                  value: controller.lcdName,
                  onChanged: (value) {
                    controller.lcdName = value;
                  },
                ),
                QTextField(
                  label: "ID Proyektor",
                  hint: controller.isEditMode ? null : "Contoh: uncpLcd00",
                  enabled: controller.isEditMode ? false : true,
                  validator: Validator.required,
                  suffixIcon: Icons.confirmation_num_outlined,
                  value: controller.lcdId,
                  onChanged: (value) {
                    controller.lcdId = value;
                  },
                ),
                controller.isEditMode
                    ? QDropdownField(
                        label: "Status",
                        validator: Validator.required,
                        value: controller.status,
                        items: const [
                          {
                            "label": "Tersedia",
                            "value": "Tersedia",
                          },
                          {
                            "label": "DiPakai",
                            "value": "Dipakai",
                          },
                          {
                            "label": "Rusak",
                            "value": "Rusak",
                          },
                        ],
                        onChanged: (value, label) {
                          controller.status = value;
                        },
                      )
                    : const SizedBox(),
                QTextField(
                  label: "Merek",
                  hint: "Contoh: Epson Proyektor XGA EB-E500",
                  validator: Validator.required,
                  suffixIcon: Icons.branding_watermark,
                  value: controller.lcdBrand,
                  onChanged: (value) {
                    controller.lcdBrand = value;
                  },
                ),
                QTextField(
                  label: "Resolusi",
                  hint: "Contoh: 1024x768 Pixel, ",
                  validator: Validator.required,
                  suffixIcon: Icons.aspect_ratio,
                  value: controller.resolution,
                  onChanged: (value) {
                    controller.resolution = value;
                  },
                ),
                QTextField(
                  label: "Berat",
                  hint: "Contoh: 2.4kg",
                  validator: Validator.required,
                  suffixIcon: Icons.equalizer,
                  value: controller.weight,
                  onChanged: (value) {
                    controller.weight = value;
                  },
                ),
                QTextField(
                  label: "Port",
                  hint: "Contoh: HDMI, VGA",
                  validator: Validator.required,
                  suffixIcon: Icons.usb_rounded,
                  value: controller.port,
                  onChanged: (value) {
                    controller.port = value;
                  },
                ),
                const SizedBox(height: 45),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: AdmSaveButton(
        onTap: () => controller.doSaveData(),
      ),
    );
  }

  @override
  State<AdmLcdDataFormView> createState() => AdmLcdDataFormController();
}
