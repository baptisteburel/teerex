import 'package:flutter/material.dart';

class FieldCommon extends StatelessWidget {
  const FieldCommon(
      {required this.valueController,
      required this.validateValue,
      required this.label,
      this.keyboardType,
      this.textInputAction,
      this.onFieldSubmitted,
      this.autofillHints,
      this.isDisabled,
      Key? key})
      : super(key: key);

  final TextEditingController valueController;
  final Function validateValue;
  final String label;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final Iterable<String>? autofillHints;
  final bool? isDisabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: isDisabled ?? false,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: textInputAction ?? TextInputAction.next,
      onFieldSubmitted: onFieldSubmitted,
      autofillHints: autofillHints,
      decoration: InputDecoration(
        errorMaxLines: 2,
        labelText: label,
      ),
      autocorrect: false,
      controller: valueController,
      validator: (value) {
        return validateValue(value!);
      },
    );
  }
}
