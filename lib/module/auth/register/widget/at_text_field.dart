// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projector_loan/shared/util/input/input.dart';
import 'package:uuid/uuid.dart';

class AtTextField extends StatefulWidget {
  final String? id;
  final String? hint;
  final String? value;
  final bool obscure;
  final bool showPasswordIcon;
  final String iconUrl;
  final String? Function(String?)? validator;
  final Iterable<String>? autofillHints;
  final TextInputType? keyboardType;
  final Function(String) onChanged;
  final Function(String)? onSubmitted;
  const AtTextField({
    Key? key,
    this.id,
    this.hint,
    this.value,
    this.obscure = false,
    this.showPasswordIcon = false,
    required this.iconUrl,
    this.validator,
    this.autofillHints,
    this.keyboardType,
    required this.onChanged,
    this.onSubmitted,
  }) : super(key: key);

  @override
  State<AtTextField> createState() => _AtTextFieldState();
}

class _AtTextFieldState extends State<AtTextField>
    implements InputControlState {
  TextEditingController textEditingController = TextEditingController();

  bool _passwordVisible = false;

  @override
  void initState() {
    textEditingController.text = widget.value ?? "";
    Input.inputController[widget.id ?? const Uuid().v4()] = this;
    super.initState();
  }

  @override
  getValue() {
    return textEditingController.text;
  }

  @override
  setValue(value) {
    textEditingController.text = value;
  }

  @override
  resetValue() {
    textEditingController.text = "";
  }

  @override
  focus() {
    focusNode.requestFocus();
  }

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: Colors.blueGrey.withOpacity(0.06),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 5),
            child: SvgPicture.asset(
              'assets/icons/${widget.iconUrl}',
              height: 18,
              colorFilter:
                  const ColorFilter.mode(Colors.black54, BlendMode.srcIn),
            ),
          ),
          Expanded(
            child: TextFormField(
              // validator: ,
              controller: textEditingController,
              focusNode: focusNode,
              keyboardType: widget.keyboardType,
              autofillHints: widget.autofillHints,
              validator: widget.validator,
              obscureText: widget.obscure && !_passwordVisible,
              onChanged: (value) {
                widget.onChanged(value);
              },
              onFieldSubmitted: (value) {
                if (widget.onSubmitted != null) widget.onSubmitted!(value);
              },
              decoration: InputDecoration(
                hintText: widget.hint ?? 'Nama Lengkap',
                hintStyle: GoogleFonts.openSans(fontSize: 15),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                border: InputBorder.none,
              ),
            ),
          ),
          if (widget.showPasswordIcon)
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: InkWell(
                onTap: () {
                  _passwordVisible = !_passwordVisible;
                  setState(() {});
                },
                child: SvgPicture.asset(
                  _passwordVisible
                      ? 'assets/icons/eye.svg'
                      : 'assets/icons/eye-slash.svg',
                  height: 18,
                  colorFilter:
                      const ColorFilter.mode(Colors.black54, BlendMode.srcIn),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
