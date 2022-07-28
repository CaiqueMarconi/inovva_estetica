import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:innova_estetica/app/core/utils/const/strings_colors.dart';

class TextFormFieldCustom extends StatelessWidget {
  final Function(String)? onChanged;
  final String labelText;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  const TextFormFieldCustom({
    Key? key,
    required this.labelText,
    required this.controller,
    this.inputFormatters,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      inputFormatters: inputFormatters,
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: StringColors.pinkClear,
            width: 2,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: StringColors.pinkClear,
            width: 2,
          ),
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          color: StringColors.pinkClear,
        ),
      ),
    );
  }
}
