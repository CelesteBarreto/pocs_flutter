import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormFieldClass extends StatelessWidget {
  String text;
  Function? onChanged;
  String? Function(String?)? validator;
  TextEditingController controller;

  CustomTextFormFieldClass({
    Key? key,
    required this.text,
    required this.onChanged,
    required this.validator,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (text) => onChanged,
      validator: (value) => validator!(value),
      inputFormatters: <TextInputFormatter>[
        ConfigTextFormatter(),
        FilteringTextInputFormatter.deny(' '),
        FilteringTextInputFormatter.deny(
          RegExp(r'[/\\]'),
        )
      ],
      maxLength: 11,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

class ConfigTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.contains('.') || newValue.text.contains(',')) {
      return oldValue;
    }
    return newValue.copyWith(
      text: '${newValue.text}',
      selection: newValue.selection,
    );
  }
} // to uppercase input


