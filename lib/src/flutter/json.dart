import 'dart:math';

import 'package:flutter/material.dart';
import 'package:velocity_x/src/extensions/iterable_ext.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/src/flutter/gesture.dart';
import 'package:velocity_x/src/flutter/toast.dart';
import 'package:velocity_x/src/flutter/transform.dart';
import 'package:velocity_x/src/flutter/universal.dart';
import 'package:velocity_x/src/velocity_xx.dart';

/// [VxJson] can be used to show json in tree view of widgets
class VxJson extends StatefulWidget {
  VxJson(this.json, {super.key})
      : list = <dynamic>[],
        isList = false;

  VxJson.list(this.list, {super.key})
      : json = list.asMap(),
        isList = true;

  final Map<dynamic, dynamic> json;
  final List<dynamic> list;
  final bool isList;

  @override
  State<VxJson> createState() => _VxJsonState();
}

class _VxJsonState extends State<VxJson> {
  Map<String, bool> mapFlag = <String, bool>{};

  @override
  Widget build(BuildContext context) => VxUniversal(
      margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children);

  List<Widget> get children {
    final List<Widget> list = <Widget>[];
    widget.json.builderEntry((MapEntry<dynamic, dynamic> entry) {
      final dynamic key = entry.key;
      final dynamic content = entry.value;
      final List<Widget> row = <Widget>[];
      if (isTap(content)) {
        row.add(VxToggleRotate(
            rad: pi / 2,
            clockwise: true,
            isRotate: (mapFlag[key.toString()]) ?? false,
            child: const Icon(Icons.arrow_right_rounded, size: 18)));
      } else {
        row.add(const SizedBox(width: 14));
      }
      row.addAll(<Widget>[
        (widget.isList || isTap(content) ? '[$key]:' : ' $key :')
            .toString()
            .text
            .fontWeight(FontWeight.w400)
            .color(content == null ? Vx.zinc500 : Vx.pink500)
            .make()
            .onDoubleTap(() {
          Vx.toClipboard(key.toString());
          VxToast.show(context, msg: 'Copied $key');
        }),
        const SizedBox(width: 4),
        getValueWidget(content)
      ]);
      list.add(VxUniversal(
          direction: Axis.horizontal,
          addInkWell: true,
          crossAxisAlignment: CrossAxisAlignment.start,
          onTap: !isTap(content)
              ? null
              : () {
                  mapFlag[key.toString()] = !(mapFlag[key.toString()] ?? false);
                  setState(() {});
                },
          children: row));
      list.add(const SizedBox(height: 4));
      if ((mapFlag[key.toString()]) ?? false) {
        list.add(getContentWidget(content));
      }
    });
    return list;
  }

  Widget getContentWidget(dynamic content) => content is List
      ? VxJson.list(content)
      : content is Map<String, dynamic>
          ? VxJson(content)
          : VxJson({content.runtimeType: content.toString()});

  Widget getValueWidget(dynamic content) {
    String text = '';
    Color color = Colors.transparent;
    if (content == null) {
      text = 'null';
      color = Vx.zinc500;
    } else if (content is num) {
      text = content.toString();
      color = Vx.green700;
    } else if (content is String) {
      text = '"$content"';
      color = Vx.blue700;
    } else if (content is bool) {
      text = content.toString();
      color = Vx.amber600;
    } else if (content is List) {
      text = content.isEmpty
          ? 'Array[0]'
          : 'Array<${content.runtimeType.toString()}>[${content.length}]';
      color = Vx.zinc500;
    } else {
      text = 'Object';
      color = Vx.zinc500;
    }
    return VxUniversal(
      expanded: true,
      onTap: () {
        Vx.toClipboard(text);
        VxToast.show(context, msg: 'Copied');
      },
      onLongPress: () {
        Vx.toClipboard(text);
        VxToast.show(context, msg: 'Copied');
      },
      child: text.text
          .color(color)
          .fontWeight(FontWeight.w400)
          .align(TextAlign.left)
          .make(),
    );
  }

  bool isTap(dynamic content) => !(content == null ||
      content is int ||
      content is String ||
      content is bool ||
      content is double ||
      (content is List && content.isEmpty));
}
