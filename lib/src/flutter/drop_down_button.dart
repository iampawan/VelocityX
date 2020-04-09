import 'package:velocity_x/src/flutter/builder.dart';
import 'package:flutter/material.dart';

class VxDropDownButton extends VxWidgetBuilder<StatefulBuilder> {
  VxDropDownButton(
    this.items, {
    this.valueHolder,
  });

  List<String> items;
  String valueHolder;
  TextStyle _textStyle;
  Widget _underLine;
  int _elevation;
  double _iconSize;
  Icon _dropDownIcon;
  Color _disabledIconColor;
  Color _enabledIconColor;
  Color _focusColor;
  bool _autoFocus = false;
  bool _isExpanded = false;
  bool _isDense = false;

  VxDropDownButton textStyle(TextStyle style) => this.._textStyle = style;

  VxDropDownButton underLine(Widget widget) => this.._underLine = widget;

  VxDropDownButton elevation(int val) => this.._elevation = val;

  VxDropDownButton iconSize(double val) => this.._iconSize = _iconSize;

  VxDropDownButton icon(Icon _icon) => this.._dropDownIcon = _icon;

  VxDropDownButton disabledIconColor(Color color) =>
      this.._disabledIconColor = color;

  VxDropDownButton enabledIconColor(Color color) =>
      this.._enabledIconColor = color;

  VxDropDownButton get autoFocus => this.._autoFocus = true;

  VxDropDownButton get isExpanded => this.._isExpanded = true;

  VxDropDownButton get isDense => this.._isDense = true;

  VxDropDownButton focusColor(Color color) => this.._focusColor = color;

  @override
  StatefulBuilder make({Key key}) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return DropdownButton<String>(
          key: key,
          value: valueHolder,
          style: _textStyle,
          underline: _underLine,
          iconEnabledColor: _enabledIconColor,
          iconDisabledColor: _disabledIconColor,
          elevation: _elevation ?? 8,
          iconSize: _iconSize ?? 24,
          icon: _dropDownIcon,
          autofocus: _autoFocus,
          isExpanded: _isExpanded,
          focusColor: _focusColor,
          isDense: _isDense,
          items: items
              .map<DropdownMenuItem<String>>((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  ))
              .toList(),
          onChanged: (String value) {
            setState(() {
              valueHolder = value;
            });
          },
        );
      },
    );
  }
}

extension DropDownButtonExtension on List<String> {
  VxDropDownButton dropDownButton({@required String valueHolder}) =>
      VxDropDownButton(this, valueHolder: valueHolder);
}
