import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardTitle extends StatelessWidget {
  const CardTitle(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        text.tr,
        style: Theme.of(context)
            .textTheme
            .headlineMedium
            ?.copyWith(color: Colors.black),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
