import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({required this.title, Key? key}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        title,
        style: Theme.of(context).textTheme.displayMedium,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
