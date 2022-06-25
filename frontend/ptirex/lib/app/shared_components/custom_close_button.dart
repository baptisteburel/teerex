import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCloseButton extends StatelessWidget {
  const CustomCloseButton({this.onPressed = "default", Key? key})
      : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 20),
        child: InkWell(
            onTap: onPressed == "default" ? () => Get.back() : onPressed,
            child: const Icon(Icons.close)));
  }
}
