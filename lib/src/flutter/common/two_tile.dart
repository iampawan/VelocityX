import 'package:flutter/material.dart';

class TwoTile extends StatelessWidget {
  final String title;
  final double titleFontSize;
  final Color titleColor;
  final String subtitle;
  final TextSpan subtitle2;
  final TextSpan subtitle3;
  final double subtitleFontSize;
  final Color subtitleColor;
  final bool isSubtitleBold;
  final CrossAxisAlignment crossAxisAlignment;

  const TwoTile({
    Key key,
    @required this.title,
    this.titleFontSize = 14.0,
    this.titleColor = Colors.grey,
    @required this.subtitle,
    this.subtitle2,
    this.subtitle3,
    this.subtitleFontSize = 16.0,
    this.subtitleColor,
    this.isSubtitleBold = false,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      textBaseline: TextBaseline.alphabetic,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: titleFontSize, color: titleColor),
        ),
        const SizedBox(
          height: 8,
        ),
        Text.rich(
          TextSpan(
            text: subtitle,
            children: [
              subtitle2 ?? const TextSpan(),
              subtitle3 ?? const TextSpan(),
            ],
          ),
          maxLines: 1,
          textAlign: TextAlign.justify,
          softWrap: true,
          style: TextStyle(
            fontWeight: isSubtitleBold ? FontWeight.bold : FontWeight.normal,
            fontSize: subtitleFontSize,
            textBaseline: TextBaseline.alphabetic,
            color: subtitleColor,
          ),
        )
      ],
    );
  }
}

class TwoTileColumn extends StatelessWidget {
  final Widget top;
  final Widget bottom;

  const TwoTileColumn({Key key, @required this.top, @required this.bottom})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        top,
        const SizedBox(
          height: 10,
        ),
        bottom,
      ],
    );
  }
}

class TwoTileRow extends StatelessWidget {
  final Widget left;
  final Widget right;

  const TwoTileRow({Key key, @required this.left, @required this.right})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        left,
        const SizedBox(
          width: 10,
        ),
        right,
      ],
    );
  }
}

class TwoTileIconColumn extends StatelessWidget {
  final Widget top;
  final Widget bottom;
  final Widget icon;

  const TwoTileIconColumn(
      {Key key, @required this.top, @required this.bottom, @required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        top,
        const SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            icon,
            const SizedBox(
              width: 10,
            ),
            bottom,
          ],
        ),
      ],
    );
  }
}
