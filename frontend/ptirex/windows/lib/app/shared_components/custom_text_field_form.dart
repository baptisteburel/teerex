import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldForm extends StatelessWidget {
  CustomTextFieldForm(
      {required this.editingController,
      required this.validateValue,
      required this.label,
      this.textInputFormatter,
      this.keyboardType,
      this.textInputAction,
      this.isEmptyField,
      this.onFieldSubmitted,
      this.autofillHints,
      this.isDisabled,
      Key? key})
      : super(key: key);

  final String label;
  final TextEditingController editingController;
  final List<TextInputFormatter>? textInputFormatter;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Function validateValue;
  final bool? isEmptyField;
  final Function(String)? onFieldSubmitted;
  final Iterable<String>? autofillHints;
  final bool? isDisabled;
  final FocusNode skippedFocusNode = FocusNode()..skipTraversal = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: editingController,
      textInputAction: textInputAction ?? TextInputAction.next,
      inputFormatters: textInputFormatter,
      onFieldSubmitted: onFieldSubmitted,
      autofillHints: autofillHints,
      keyboardType: keyboardType,
      readOnly: isDisabled ?? false,
      focusNode: isDisabled ?? false ? skippedFocusNode : null,
      style: Theme.of(context).textTheme.bodyLarge,
      decoration: InputDecoration(
        errorMaxLines: 2,
        labelText: label,
        labelStyle: Theme.of(context).textTheme.bodyLarge,
        fillColor: isDisabled ?? false ? Colors.grey[400] : Colors.grey[300],
        border: UnderlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5)),
        filled: true,
        suffixIcon: isEmptyField ?? true
            ? null
            : IconButton(
                focusNode: FocusNode()..skipTraversal = true,
                onPressed: (() {
                  editingController.text = "";
                }),
                icon: const Icon(Icons.clear),
                highlightColor: Colors.transparent,
                color: Colors.grey,
              ),
      ),
      validator: (value) {
        return validateValue(value);
      },
    );
  }
}
