import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseFormField extends StatelessWidget {
  TextEditingController controller;
  TextInputType? inputType;
  TextInputAction? inputAction;
  String? initialValue;
  String? hint;
  String? Function(String? value)? validator;
  List<TextInputFormatter>? formatters;

  BaseFormField({
    super.key,
    required this.controller,
    this.initialValue,
    this.inputType,
    this.inputAction,
    this.formatters,
    this.validator,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      controller: controller,
      textInputAction: inputAction,
      keyboardType: inputType,
      inputFormatters: formatters,
      validator: validator,
      style: TextStyle(fontSize: 20, color: Colors.deepOrange[900]),
      decoration: InputDecoration(
        disabledBorder: const UnderlineInputBorder(),
        enabledBorder: const UnderlineInputBorder(),
        errorBorder: const UnderlineInputBorder(),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.deepOrange.shade900)),
        fillColor: Colors.orange,
        border: InputBorder.none,
        hintText: hint,
      ),
    );
  }
}
