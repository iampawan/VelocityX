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

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

const double _kDefaultButtonSize = 32;
const double _kDefaultSpace = 8;
const double _kDefaultTextFontSize = 16;

/// VxStepper widget to have a input enabled counter with 2 buttons, one for addition and one for subtraction with good level of customization.
class VxStepper extends StatefulWidget {
  final num defaultValue;
  final int min;
  final int max;
  final int step;
  final bool disableInput;
  final ValueChanged<int>? onChange;
  final Color? inputBoxColor,
      inputTextColor,
      actionButtonColor,
      actionIconColor;

  const VxStepper({
    super.key,
    this.defaultValue = 0,
    this.min = 0,
    this.max = 999,
    this.step = 1,
    this.disableInput = false,
    this.onChange,
    this.inputBoxColor,
    this.inputTextColor,
    this.actionButtonColor,
    this.actionIconColor,
  })  : assert(max >= min),
        assert(step >= 1);

  @override
  VxStepperState createState() => VxStepperState();
}

class VxStepperState extends State<VxStepper> {
  TextEditingController? controller;

  num recordNumber = 0;
  late bool enableMin;
  late bool enableMax;

  @override
  void initState() {
    super.initState();
    recordNumber =
        math.min(widget.max, math.max(widget.defaultValue, widget.min));
    controller = TextEditingController(text: '$recordNumber');
    controller!.addListener(valueChange);

    valueChange();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];

    children.add(SizedBox(
      height: _kDefaultButtonSize,
      width: _kDefaultButtonSize,
      child: FilledButton(
        style: FilledButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: widget.actionButtonColor,
          padding: EdgeInsets.zero,
        ),
        onPressed: enableMin ? onRemove : null,
        child: Icon(
          Icons.remove,
          color: widget.actionIconColor,
          size: _kDefaultTextFontSize,
        ),
      ),
    ));

    children.add(const SizedBox(width: _kDefaultSpace));

    children.add(TextField(
      controller: controller,
      textAlign: TextAlign.center,
      enabled: !widget.disableInput,
      style: TextStyle(color: widget.inputTextColor),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp("[-0-9]")),
        LengthLimitingTextInputFormatter(3),
      ],
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
      onEditingComplete: inputComplete,
    ).wh(_kDefaultButtonSize, _kDefaultButtonSize * 1.7));

    children.add(const SizedBox(width: _kDefaultSpace));
    children.add(SizedBox(
      height: _kDefaultButtonSize,
      width: _kDefaultButtonSize,
      child: FilledButton(
        style: FilledButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: widget.actionButtonColor,
          padding: EdgeInsets.zero,
        ),
        onPressed: enableMax ? onAdd : null,
        child: Icon(
          Icons.add,
          color: widget.actionIconColor,
          size: _kDefaultTextFontSize,
        ),
      ),
    ));

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  void unFocus() {
    if (FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    }
  }

  void onRemove() {
    unFocus();
    int number = getNumber();
    number = math.max(
      widget.min,
      number - widget.step,
    );
    if (number != recordNumber) {
      updateControllerValue(number);
    }
  }

  void onAdd() {
    unFocus();
    int number = getNumber();
    number = math.min(
      widget.max,
      number + widget.step,
    );
    if (number != recordNumber) {
      updateControllerValue(number);
    }
  }

  int getNumber() {
    final String temp = controller!.text;
    if (temp.isEmpty) {
      return widget.min;
    } else {
      return math.min(widget.max, num.parse(temp) as int);
    }
  }

  void updateControllerValue(num number) {
    controller!.text = '$number';
    recordNumber = number;
    setState(() {});
  }

  void valueChange() {
    final num number = getNumber();
    enableMin = number != widget.min;
    enableMax = number != widget.max;
    if (number != recordNumber) {
      if (enableMax || enableMin) {
        recordNumber = number;
        setState(() {});
        callBackNumber();
      }
    }
  }

  void inputComplete() {
    unFocus();
    final int temp = getNumber();
    controller!.text = '$temp';
    recordNumber = temp;
  }

  void callBackNumber() {
    if (widget.onChange != null) {
      final int temp = getNumber();
      widget.onChange!(temp);
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
