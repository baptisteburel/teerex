import 'package:flutter/material.dart';

class CardDescription extends StatelessWidget {
  const CardDescription(this.text, this.onPrimary, {int? numberLines, Key? key})
      : super(key: key);

  final String text;
  final Color onPrimary;
  static int? numberLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: onPrimary,
        letterSpacing: 1,
      ),
      maxLines: numberLines ?? 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
