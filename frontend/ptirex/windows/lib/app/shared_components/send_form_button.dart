// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class SendFormButton extends StatelessWidget {
  const SendFormButton(
      {required bool this.disableCondition,
      required this.isLoading,
      required Function this.onPressed,
      required String this.label,
      Key? key})
      : super(key: key);
  final disableCondition;
  final isLoading;
  final label;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: MaterialButton(
        onPressed: disableCondition ? null : onPressed,
        color: Colors.green.shade600,
        disabledColor: Colors.green.shade600.withOpacity(0.8),
        minWidth: MediaQuery.of(context).size.width,
        height: 50,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: isLoading
            ? Container(
                width: 24,
                height: 24,
                padding: const EdgeInsets.all(2.0),
                child: const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 3,
                ),
              )
            : Text(
                label,
                style: Theme.of(context).textTheme.titleSmall,
              ),
      ),
    );
  }
}
