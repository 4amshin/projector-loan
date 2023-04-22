// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:projector_loan/model/student_model.dart';
import 'package:projector_loan/module/student/st_profile_edit_form/controller/st_profile_edit_form_controller.dart';
import 'package:projector_loan/module/student/st_profile_edit_form/widget/st_save_button.dart';
import 'package:projector_loan/shared/util/validator/validator.dart';
import 'package:projector_loan/shared/widget/appBar_title/app_bar_title.dart';
import 'package:projector_loan/shared/widget/image_picker/image_picker.dart';
import 'package:projector_loan/shared/widget/input_field/q_text_field.dart';

class StProfileEditFormView extends StatefulWidget {
  final Student student;
  const StProfileEditFormView({
    Key? key,
    required this.student,
  }) : super(key: key);

  Widget build(context, StProfileEditFormController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(title: 'Edit Profile'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        child: ListView(
          children: [
            QImagePicker(
              label: "Foto Profil",
              validator: Validator.required,
              value: controller.imgUrl,
              onChanged: (value) {
                controller.imgUrl = value;
              },
            ),
            const SizedBox(height: 20),
            QTextField(
              label: "Nama Lengkap",
              validator: Validator.required,
              value: controller.name,
              onChanged: (value) {
                controller.name = value;
              },
            ),
            const SizedBox(height: 20),
            QTextField(
              label: "NIM",
              validator: Validator.required,
              value: controller.nim,
              suffixIcon: Icons.numbers,
              onChanged: (value) {
                controller.nim = value;
              },
            ),
          ],
        ),
      ),
      floatingActionButton: StSaveButton(
        onTap: () => controller.saveStudentData(),
      ),
    );
  }

  @override
  State<StProfileEditFormView> createState() => StProfileEditFormController();
}
