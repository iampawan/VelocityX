/*
 * Copyright 2020 Pawan Kumar. All rights reserved.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:velocity_x/src/flutter/builder.dart';
import 'package:flutter/material.dart';

class VxDropDownButton extends VxWidgetBuilder<StatefulBuilder> {
  VxDropDownButton(
    this._items, {
    @required this.valueHolder,
  }) : assert(valueHolder != null);


  final List<String> _items;
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

  ValueChanged<String> _onValueChange;

  VxDropDownButton textStyle(TextStyle style) => this.._textStyle = style;

  VxDropDownButton underLine(Widget widget) => this.._underLine = widget;

  VxDropDownButton elevation(int val) => this.._elevation = val;

  VxDropDownButton iconSize(double val) => this.._iconSize = val;

  VxDropDownButton icon(Icon _icon) => this.._dropDownIcon = _icon;

  VxDropDownButton disabledIconColor(Color color) =>
      this.._disabledIconColor = color;

  VxDropDownButton enabledIconColor(Color color) =>
      this.._enabledIconColor = color;

  VxDropDownButton get autoFocus => this.._autoFocus = true;

  VxDropDownButton get isExpanded => this.._isExpanded = true;

  VxDropDownButton get isDense => this.._isDense = true;

  VxDropDownButton focusColor(Color color) => this.._focusColor = color;

  VxDropDownButton onChange(ValueChanged<String> function) =>
      this.._onValueChange = function;


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
          items: _items
              .map<DropdownMenuItem<String>>((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  ))
              .toList(),
          onChanged: (String value) {
            setState(() {
              valueHolder = value;
            });
            _onValueChange(value);
          },
        );
      },
    );
  }
}

extension DropDownExtension on List<String> {
  VxDropDownButton dropDown({@required String value}) =>
      VxDropDownButton(this, valueHolder: value);
}
