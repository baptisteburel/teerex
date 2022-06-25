import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class FieldPassword extends StatelessWidget {
  const FieldPassword(
      {required this.passwordController,
      required this.showPasswordValue,
      required this.updateShowPassword,
      required this.validatePassword,
      required this.label,
      this.textInputAction,
      this.onFieldSubmitted,
      Key? key})
      : super(key: key);

  final TextEditingController passwordController;
  final bool showPasswordValue;
  final Function updateShowPassword;
  final Function validatePassword;
  final String label;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textInputAction: textInputAction ?? TextInputAction.next,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
          errorMaxLines: 2,
          labelText: label,
          suffixIcon: IconButton(
              focusNode: FocusNode(skipTraversal: true),
              padding: const EdgeInsets.only(right: 8),
              icon: Icon(showPasswordValue ? EvaIcons.eye : EvaIcons.eyeOff),
              iconSize: 18,
              onPressed: () {
                updateShowPassword();
              })),
      obscureText: !showPasswordValue,
      enableSuggestions: false,
      autocorrect: false,
      controller: passwordController,
      validator: (value) {
        return validatePassword(value!);
      },
    );
  }
}
