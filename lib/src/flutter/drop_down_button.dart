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

import 'package:flutter/material.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';
import 'package:velocity_x/src/flutter/builder.dart';

/// A material design button for selecting from a list of items.
///
/// A dropdown button lets the user select from a number of items. The button
/// shows the currently selected item as well as an arrow that opens a menu for
/// selecting another item.
///
/// The type `T` is the type of the [value] that each dropdown item represents.
/// All the entries in a given menu must represent values with consistent types.
/// Typically, an enum is used. Each [DropdownMenuItem] in [items] must be
/// specialized with that same type argument.
///
/// The [onChanged] callback should update a state variable that defines the
/// dropdown's value. It should also call [State.setState] to rebuild the
/// dropdown with the new value.
///
/// {@tool dartpad --template=stateful_widget_scaffold_center}
///
/// {@end-tool}
/// This sample shows a `DropdownButton` with a large arrow icon,
/// purple text style, and bold purple underline, whose value is one of "One",
/// "Two", "Free", or "Four".
///
/// ![](https://flutter.github.io/assets-for-api-docs/assets/material/dropdown_button.png)
///
class VxTextDropDown extends VxWidgetBuilder<StatefulBuilder> {
  VxTextDropDown(
    this._items, {
    required String this.selectedValue,
    required this.onChanged,
  });

  /// The List<String> used to create [DropdownMenuItem].
  ///
  /// _items can't be null.
  final List<String> _items;

  /// The value used to define currently selected value of [VxTextDropDown].
  String? selectedValue;

  /// Defines the [TextStyle] for [DropdownMenuItem].
  ///
  /// By default the value of `_textStyle` is [TextTheme.titleMedium]
  /// value of the current [ThemeData.textTheme].
  TextStyle? _textStyle;

  ///  Defines the widget used to draw underline for [VxTextDropDown]
  Widget? _underLine;

  /// Defines the elevation for menu when drop down is open.
  ///
  /// By default, the value of `_elevation` is 8.
  int? _elevation;

  /// Defines the size of [VxTextDropDown] icon.
  ///
  /// By default, the value of `_iconSize` is 24.
  double? _iconSize;

  /// The [Icon] used for [VxTextDropDown].
  ///
  /// By default, the icon is [Icons.arrow_drop_down]
  Icon? _dropDownIcon;

  /// Defines the drop down button icon color when button is disabled.
  ///
  /// By default, the color is `Colors.grey.shade400`.
  Color? _disabledIconColor;

  /// Defines the drop down button icon color when button is enabled.
  ///
  /// By default, the color is `Colors.grey.shade700`  when the theme's [ThemeData.brightness]
  /// is [Brightness.light] and to [Colors.white70] when it is [Brightness.dark].
  Color? _enabledIconColor;

  /// The color for the button's Material when it has the input focus.
  Color? _focusColor;

  /// If the `_autoFocus` is true, [VxTextDropDown] will be selected as the initial focus when no other node
  /// in its scope is currently focused.
  bool _autoFocus = false;

  /// Set the dropdown's inner contents to horizontally fill its parent.
  bool _isExpanded = false;

  /// Reduce the button's height.
  ///
  /// By default this button's height is the same as its menu items' heights.
  bool _isDense = false;

  /// Called when user selects a value from drop down menu.
  ValueChanged<String?> onChanged;

  VxTextDropDown textStyle(TextStyle style) => this.._textStyle = style;

  VxTextDropDown underLine(Widget widget) => this.._underLine = widget;

  VxTextDropDown elevation(int val) => this.._elevation = val;

  VxTextDropDown iconSize(double val) => this.._iconSize = val;

  VxTextDropDown icon(Icon icon) => this.._dropDownIcon = icon;

  VxTextDropDown disabledIconColor(Color color) =>
      this.._disabledIconColor = color;

  VxTextDropDown enabledIconColor(Color color) =>
      this.._enabledIconColor = color;

  VxTextDropDown get autoFocus => this.._autoFocus = true;

  VxTextDropDown get isExpanded => this.._isExpanded = true;

  VxTextDropDown get isDense => this.._isDense = true;

  VxTextDropDown focusColor(Color color) => this.._focusColor = color;

//  VxTextDropDown onChange(ValueChanged<String> function) =>
//      this..onChanged = function;

  @override
  StatefulBuilder make({Key? key}) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return DropdownButton<String>(
          key: key,
          value: selectedValue,
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
                    child: item.text.make(),
                  ))
              .toList(),
          onChanged: (String? value) {
            setState(() {
              selectedValue = value;
            });
            onChanged(value);
          },
        );
      },
    );
  }
}

extension VxDropDownExtension on List<String> {
  ///
  /// Extension method to directly access [VxTextDropDown] with any widget without wrapping or with dot operator.
  ///
  /// The [selectedValue] should be a part of the list of strings.
  VxTextDropDown textDropDown(
          {required String selectedValue,
          required ValueChanged<String?> onChanged}) =>
      VxTextDropDown(this, selectedValue: selectedValue, onChanged: onChanged);
}
