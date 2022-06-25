import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DevelopedByS3EB extends StatelessWidget {
  const DevelopedByS3EB({required this.color, Key? key}) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(children: [
          // WidgetSpan(
          //   alignment: PlaceholderAlignment.middle,
          //   child: SvgPicture.asset(
          //     ImageVectorPath.copyrightSvg,
          //     height: 12,
          //     color: color,
          //   ),
          // ),
          const WidgetSpan(
              child: SizedBox(
            width: 5,
          )),
          TextSpan(
            text: "Développé par",
            style:
                Theme.of(context).textTheme.bodySmall!.copyWith(color: color),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: InkWell(
                onTap: () => launch(
                    "https://www.linkedin.com/in/baptiste-burel-483868205/"),
                child: Text(
                  " teeRex",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: color),
                )),
          ),
        ]),
      ),
    );
  }
}
