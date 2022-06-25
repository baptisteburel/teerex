import 'package:flutter/material.dart';

class TagCard extends StatelessWidget {
  const TagCard({required this.title, this.color, this.size, Key? key})
      : super(key: key);
  final String title;
  final Color? color;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return Card(
        color: color ?? Colors.green.shade600,
        child: Padding(
          padding: size == null
              ? const EdgeInsets.symmetric(horizontal: 4, vertical: 2)
              : EdgeInsets.symmetric(
                  horizontal: size! * 4 / 15, vertical: size! * 2 / 15),
          child: Text(
            title.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Colors.white, fontSize: size),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ));
  }
}
