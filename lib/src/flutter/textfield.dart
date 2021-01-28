import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum VxTextFieldBorderType { none, roundLine, underLine }

/// An easy to use implementation of [TextField] with ready to use props.
class VxTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String value;
  final bool clear;
  final bool isPassword;
  final bool obscureText;
  final VxTextFieldBorderType borderType;
  final int maxLine;
  final int maxLength;
  final TextAlign textAlign;
  final Color fillColor;
  final Color borderColor;
  final Widget prefixIcon;
  final double height;
  final Widget icon;
  final double borderRadius;
  final double contentPaddingLeft;
  final double contentPaddingTop;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final List<TextInputFormatter> inputFormatters;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final VoidCallback onEditingComplete;
  final FocusNode focusNode;
  final String counterText;
  final bool autofocus;
  final TextStyle style;
  final String labelText;
  final TextStyle labelStyle;
  final TextStyle hintStyle;

  const VxTextField(
      {Key key,
      this.controller,
      this.hint,
      this.value,
      this.clear = true,
      this.isPassword = false,
      this.obscureText = false,
      this.borderType = VxTextFieldBorderType.underLine,
      this.maxLine = 1,
      this.maxLength,
      this.textAlign = TextAlign.left,
      this.fillColor,
      this.borderColor,
      this.prefixIcon,
      this.height = 40,
      this.icon,
      this.borderRadius,
      this.contentPaddingLeft,
      this.contentPaddingTop,
      this.keyboardType,
      this.textInputAction,
      this.inputFormatters,
      this.onChanged,
      this.onSubmitted,
      this.onEditingComplete,
      this.focusNode,
      this.counterText,
      this.autofocus = false,
      this.style,
      this.labelText,
      this.labelStyle,
      this.hintStyle})
      : super(key: key);

  @override
  _VxTextFieldState createState() => _VxTextFieldState();
}

class _VxTextFieldState extends State<VxTextField> {
  TextEditingController controller;
  bool obscureText = false;
  FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController(text: widget.value);
    obscureText = widget.obscureText;
    focusNode = widget.focusNode ?? FocusNode();
    focusNode.addListener(notify);
  }

  @override
  Widget build(BuildContext context) {
    final Widget textField = TextField(
      controller: controller,
      obscureText: obscureText,
      textAlign: widget.textAlign,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      focusNode: focusNode,
      autofocus: widget.autofocus,
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        icon: widget.icon,
        prefixIcon: widget.prefixIcon,
        suffixIcon: suffixView(),
        hintText: widget.hint,
        hintStyle: widget.hintStyle,
        fillColor: widget.fillColor,
        counterText: widget.counterText,
        filled: true,
        labelText: widget.labelText,
        labelStyle: widget.labelStyle,
        contentPadding: getContentPadding(),
        enabledBorder: getInputBorder(),
        focusedBorder: getInputBorder(),
      ),
      maxLength: widget.maxLength,
      maxLines: widget.maxLine,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onSubmitted: onSubmitted,
      style: widget.style,
    );

    if (widget.maxLine == null &&
        widget.borderType == VxTextFieldBorderType.roundLine) {
      return Container(
        decoration: getBoxDecoration(),
        constraints: BoxConstraints(minHeight: widget.height),
        child: textField,
      );
    }

    return textField;
  }

  /// Suffix widget to show
  Widget suffixView() {
    final List<Widget> children = [];
    final String tempValue = controller.text;
    final double tempSize = math.min(widget.height / 2, 24);

    // Clear Button
    if (widget.clear &&
        focusNode.hasFocus &&
        (tempValue != null && tempValue.isNotEmpty)) {
      children.add(GestureDetector(
        onTap: clear,
        child: Icon(Icons.clear, size: tempSize),
      ));
    }

    // Password Button
    if (widget.isPassword) {
      if (children.isNotEmpty) {
        children.add(const SizedBox(width: 8));
      }
      children.add(GestureDetector(
        onTap: togglePwd,
        child: Icon(
          obscureText ? Icons.visibility : Icons.visibility_off,
          size: tempSize,
        ),
      ));
    }

    if (children.isNotEmpty) {
      if (widget.borderType == VxTextFieldBorderType.roundLine) {
        children.add(const SizedBox(width: 8));
      }
      return Container(
        child: Row(
          children: children,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
        ),
      );
    }
    return null;
  }

  /// Content spacing
  EdgeInsetsGeometry getContentPadding() {
    double contentPaddingLeft = 8;
    if (widget.prefixIcon == null) {
      if (widget.borderType == VxTextFieldBorderType.roundLine) {
        contentPaddingLeft = getBorderRadius();
      } else {
        contentPaddingLeft = 0.0;
      }
    }
    return EdgeInsets.only(
      left: widget.contentPaddingLeft ?? contentPaddingLeft,
      right: 8,
      top: widget.contentPaddingTop ?? (widget.height - 20) / 2,
      bottom: (widget.height - 20) / 2,
    );
  }

  /// Radius to the corner
  double getBorderRadius() {
    return widget.borderRadius ?? (widget.height + 10) / 2;
  }

  /// Non-filled decoration

  InputBorder getInputBorder() {
    final Color tempColor =
        widget.borderColor ?? Theme.of(context).primaryColor;
    if (widget.borderType == VxTextFieldBorderType.none) {
      return InputBorder.none;
    } else if (widget.borderType == VxTextFieldBorderType.roundLine) {
      if (widget.maxLine == null) {
        return OutlineInputBorder(
          gapPadding: 0,
          borderSide: const BorderSide(color: Colors.transparent, width: 1),
          borderRadius: BorderRadius.circular(getBorderRadius()),
        );
      } else {
        return OutlineInputBorder(
          gapPadding: 0,
          borderSide: BorderSide(color: tempColor, width: 1),
          borderRadius: BorderRadius.circular(getBorderRadius()),
        );
      }
    } else if (widget.borderType == VxTextFieldBorderType.underLine) {
      return UnderlineInputBorder(
          borderSide: BorderSide(color: tempColor, width: 1));
    }
    return null;
  }

  /// Fill decoration

  BoxDecoration getBoxDecoration() {
    final Color tempColor =
        widget.borderColor ?? Theme.of(context).primaryColor;
    if (widget.borderType == VxTextFieldBorderType.roundLine) {
      return BoxDecoration(
        color: widget.fillColor,
        border: Border.all(color: tempColor, width: 1),
        borderRadius: BorderRadius.circular(getBorderRadius()),
      );
    }
    return null;
  }

  /// Clear the controller value
  void clear() {
    controller?.clear();
    notify();
  }

  /// Toggling the password
  void togglePwd() {
    obscureText = !obscureText;
    setState(() {});
  }

  /// when change in the textfield
  void onChanged(String value) {
    notify();
    if (widget.onChanged != null) {
      widget.onChanged(value);
    }
  }

  /// After the completion of editing
  void onEditingComplete() {
//    FocusScope.of(context).unfocus();
    if (widget.onEditingComplete != null) {
      widget.onEditingComplete();
    }
  }

  /// After submitting the textfield
  void onSubmitted(String value) {
//    FocusScope.of(context).unfocus();
    if (widget.onSubmitted != null) {
      widget.onSubmitted(value);
    }
  }

  /// Updating the view
  void notify() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    focusNode?.dispose();
    super.dispose();
  }
}
