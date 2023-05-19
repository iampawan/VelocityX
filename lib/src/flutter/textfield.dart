import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum VxTextFieldBorderType { none, roundLine, underLine }

/// An easy to use implementation of [TextField] with ready to use props.
class VxTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;

  ///[TextStyle] or hints
  final TextStyle? hintStyle;
  final String? value;
  final bool clear;
  final bool isPassword;
  final bool obscureText;
  final VxTextFieldBorderType borderType;
  final int? maxLine;
  final int? maxLength;
  final TextAlign textAlign;
  final Color? fillColor;
  final Color? borderColor;
  final Widget? prefixIcon;
  final double height;
  final Widget? icon;
  final double? borderRadius;
  final double? contentPaddingLeft;
  final double? contentPaddingTop;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onEditingComplete;
  final FocusNode? focusNode;
  final String? counterText;
  final bool autofocus;
  final TextStyle? style;
  final String? labelText;
  final TextStyle? labelStyle;
  final Color? cursorColor;
  final bool readOnly;

  /// The color of the [suffixIcon].
  final Color? suffixColor;
  final bool autocorrect;
  final double? cursorHeight;
  final double cursorWidth;
  final Radius? cursorRadius;
  final bool enableSuggestions;
  final bool? enabled;
  final bool? showCursor;
  final Widget Function(BuildContext, EditableTextState)? contextMenuBuilder;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final String? initialValue;

  const VxTextField({
    super.key,
    this.controller,
    this.hint,
    this.hintStyle,
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
    this.cursorColor,
    this.suffixColor,
    this.autocorrect = true,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorWidth = 2.0,
    this.enableSuggestions = true,
    this.enabled,
    this.showCursor,
    this.contextMenuBuilder,
    this.onSaved,
    this.validator,
    this.autovalidateMode,
    this.readOnly = false,
    this.initialValue,
  }) : assert(initialValue == null || controller == null);

  @override
  VxTextFieldState createState() => VxTextFieldState();
}

class VxTextFieldState extends State<VxTextField> {
  TextEditingController? controller;
  bool obscureText = false;
  FocusNode? focusNode;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController(text: widget.value);
    obscureText = widget.obscureText;
    focusNode = widget.focusNode ?? FocusNode();
    focusNode!.addListener(notify);
  }

  @override
  Widget build(BuildContext context) {
    final Widget textField = TextFormField(
      key: widget.key,
      initialValue: widget.initialValue,
      controller: controller,
      obscureText: obscureText,
      textAlign: widget.textAlign,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      focusNode: focusNode,
      autofocus: widget.autofocus,
      cursorColor: widget.cursorColor,
      autocorrect: widget.autocorrect,
      cursorHeight: widget.cursorHeight,
      cursorRadius: widget.cursorRadius,
      cursorWidth: widget.cursorWidth,
      enableSuggestions: widget.enableSuggestions,
      enabled: widget.enabled,
      showCursor: widget.showCursor,
      contextMenuBuilder: widget.contextMenuBuilder,
      inputFormatters: widget.inputFormatters,
      autovalidateMode: widget.autovalidateMode,
      readOnly: widget.readOnly,
      decoration: InputDecoration(
        icon: widget.icon,
        prefixIcon: widget.prefixIcon,
        suffixIcon: suffixView(),
        suffixIconColor: widget.suffixColor,
        hintText: widget.hint,
        hintStyle: widget.hintStyle,
        fillColor: widget.fillColor,
        counterText: widget.counterText,
        filled: true,
        labelText: widget.labelText,
        labelStyle: widget.labelStyle,
        contentPadding: getContentPadding(),
        border: getInputBorder(),
        enabledBorder: getInputBorder(),
        focusedBorder: getInputBorder(),
      ),
      maxLength: widget.maxLength,
      maxLines: widget.maxLine,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onSubmitted,
      onSaved: widget.onSaved,
      validator: widget.validator,
      style: widget.style,
    );

    const other = null;
    if (widget.maxLine == other &&
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
  Widget? suffixView() {
    final List<Widget> children = [];
    final String tempValue = controller!.text;
    final double tempSize = math.min(widget.height / 2, 24);
    final Color tempColor =
        widget.suffixColor ?? Theme.of(context).iconTheme.color ?? Colors.black;

    // Clear Button
    if (widget.clear && focusNode!.hasFocus && (tempValue.isNotEmpty)) {
      children.add(GestureDetector(
        onTap: clear,
        child: Icon(
          Icons.clear,
          size: tempSize,
          color: tempColor,
        ),
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
          color: tempColor,
        ),
      ));
    }

    if (children.isNotEmpty) {
      if (widget.borderType == VxTextFieldBorderType.roundLine) {
        children.add(const SizedBox(width: 8));
      }
      return Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: children,
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

  InputBorder? getInputBorder() {
    final Color tempColor =
        widget.borderColor ?? Theme.of(context).scaffoldBackgroundColor;
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

  BoxDecoration? getBoxDecoration() {
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
    onChanged('');
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
      widget.onChanged!(value);
    }
  }

  /// After the completion of editing
  void onEditingComplete() {
    FocusScope.of(context).unfocus();
    if (widget.onEditingComplete != null) {
      widget.onEditingComplete!();
    }
  }

  /// After submitting the textfield
  void onSubmitted(String value) {
    FocusScope.of(context).unfocus();
    if (widget.onSubmitted != null) {
      widget.onSubmitted!(value);
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
    if (widget.controller == null) {
      controller?.dispose();
    }
    focusNode?.dispose();
    super.dispose();
  }
}
