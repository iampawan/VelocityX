import 'dart:async';
import 'package:flutter/material.dart';
import 'package:velocity_x/src/flutter/divider.dart';

double _circular = 5.0;
BorderRadius _borderRadius = BorderRadius.circular(_circular);

Widget getView(dynamic child) {
  if (child is String) {
    return Text(child);
  } else if (child is Widget) {
    return child;
  }
  return const SizedBox.shrink();
}

mixin VxDialog {
  static void showAlert(
    BuildContext context, {
    String? title,
    dynamic content,
    dynamic confirm = 'OK',
    Color? confirmBgColor,
    Color? confirmTextColor,
    bool showClose = false,
    VoidCallback? onPressed,
    bool barrierDismissible = true,
  }) {
    showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => barrierDismissible,
            child: AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: _VxDialog(
                title: title,
                showClose: showClose,
                content: content,
                cancel: confirm,
                cancelBgColor: confirmBgColor,
                cancelOnPress: onPressed,
              ),
              shape: RoundedRectangleBorder(borderRadius: _borderRadius),
            ),
          );
        });
  }

  static void showConfirmation(
    BuildContext context, {
    String? title,
    bool showClose = false,
    dynamic content,
    dynamic cancel = 'Cancel',
    dynamic confirm = 'Confirm',
    Color? cancelBgColor,
    Color? confirmBgColor,
    Color? cancelTextColor,
    Color? confirmTextColor,
    VoidCallback? onCancelPress,
    VoidCallback? onConfirmPress,
    bool barrierDismissible = true,
  }) {
    showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => barrierDismissible,
            child: AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: _VxDialog(
                title: title,
                showClose: showClose,
                content: content,
                cancel: cancel,
                confirm: confirm,
                cancelBgColor: cancelBgColor,
                confirmBgColor: confirmBgColor,
                cancelOnPress: onCancelPress,
                confirmOnPress: onConfirmPress,
              ),
              shape: RoundedRectangleBorder(borderRadius: _borderRadius),
            ),
          );
        });
  }

  static void showTicker(
    BuildContext context, {
    String? title,
    bool showClose = false,
    dynamic content,
    dynamic confirm = 'Confirm',
    int secondsToAction = 3,
    Color? confirmBgColor,
    Color? confirmTextColor,
    VoidCallback? onConfirmPress,
    bool barrierDismissible = true,
  }) {
    showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => barrierDismissible,
            child: AlertDialog(
              contentPadding: EdgeInsets.zero,
              content: _VxDialog(
                title: title,
                showClose: showClose,
                content: content,
                cancel: confirm,
                cancelBgColor: confirmBgColor,
                cancelOnPress: onConfirmPress,
                second: secondsToAction,
              ),
              shape: RoundedRectangleBorder(borderRadius: _borderRadius),
            ),
          );
        });
  }

  static void showCustom(
    BuildContext context, {
    required Widget child,
    bool barrierDismissible = true,
  }) {
    showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (context) {
          return _VxCustomDialog(child: child);
        });
  }
}

class _VxDialog extends StatelessWidget {
  final String? title;
  final bool showClose;
  final dynamic content;
  final dynamic cancel;
  final dynamic confirm;
  final Color? cancelBgColor;
  final Color? confirmBgColor;
  final VoidCallback? cancelOnPress;
  final VoidCallback? confirmOnPress;
  final int? second;

  const _VxDialog({
    required this.content,
    this.title,
    this.showClose = false,
    this.cancel,
    this.confirm,
    this.cancelBgColor,
    this.confirmBgColor,
    this.cancelOnPress,
    this.confirmOnPress,
    this.second,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];
    children.add(_titleView(context));
    children.add(Flexible(child: _contentView()));
    children.add(const VxDivider());
    children.add(buttonView(context));

    return IntrinsicHeight(child: Column(children: children));
  }

  Widget _titleView(BuildContext context) {
    if (title == null) {
      return const SizedBox.shrink();
    }

    final Widget titleView = Container(
      alignment: Alignment.center,
      constraints: const BoxConstraints(minHeight: 40),
      child: Text(
        title!,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );

    if (showClose) {
      final List<Widget> children = [];
      children.add(const SizedBox(width: 40, height: 40));
      children.add(Expanded(child: titleView));
      children.add(IconButton(
        icon: const Icon(Icons.close, size: 20),
        onPressed: () => hide(context),
      ));
      return Row(children: children);
    } else {
      return titleView;
    }
  }

  Widget _contentView() {
    assert(content != null);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: getView(content),
    );
  }

  Widget buttonView(BuildContext context) {
    if (second != null) {
      return VxTimerButton(
        second: second,
        bgColor: cancelBgColor,
        button: cancel,
        tap: () => onCancel(context),
      );
    }

    if (confirm == null) {
      return InkWell(
        onTap: () => onCancel(context),
        child: Container(
          height: 42,
          decoration: BoxDecoration(
            color: cancelBgColor ?? Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(_circular),
            ),
          ),
          alignment: Alignment.center,
          child: getView(cancel),
        ),
      );
    }
    final List<Widget> children = [];
    children.add(Expanded(
      child: InkWell(
        onTap: () => onCancel(context),
        child: Container(
          decoration: BoxDecoration(
            color: cancelBgColor ?? Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(_circular),
            ),
          ),
          height: 42,
          alignment: Alignment.center,
          child: getView(cancel),
        ),
      ),
    ));
    children.add(Container(
      height: 16,
      child: const VxDivider(type: VxDividerType.vertical),
    ));
    children.add(Expanded(
      child: InkWell(
        onTap: () => onConfirm(context),
        child: Container(
          decoration: BoxDecoration(
            color: confirmBgColor ?? Theme.of(context).backgroundColor,
            borderRadius:
                BorderRadius.only(bottomRight: Radius.circular(_circular)),
          ),
          alignment: Alignment.center,
          height: 42,
          child: getView(confirm),
        ),
      ),
    ));

    return Row(children: children);
  }

  /// Close the dialog
  void hide(BuildContext context) {
    Navigator.pop(context);
  }

  /// On cancellation
  void onCancel(BuildContext context) {
    hide(context);
    if (cancelOnPress != null) {
      cancelOnPress!();
    }
  }

  /// On confirmation
  void onConfirm(BuildContext context) {
    hide(context);
    if (confirmOnPress != null) {
      confirmOnPress!();
    }
  }
}

///Read button
class VxTimerButton extends StatefulWidget {
  final int? second;
  final Color? bgColor;
  final dynamic button;
  final VoidCallback? tap;

  const VxTimerButton({
    this.second,
    this.bgColor,
    this.button,
    this.tap,
  });

  @override
  VxTimerButtonState createState() => VxTimerButtonState();
}

class VxTimerButtonState extends State<VxTimerButton> {
  int? tempSecond;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    tempSecond = widget.second ?? 3;
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (tempSecond! >= 1) {
        tempSecond = tempSecond! - 1;
      } else {
        tempSecond = 0;
        timer?.cancel();
        timer = null;
      }
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var buttonValue = widget.button;
    if (tempSecond! > 0) {
      buttonValue = '$tempSecond s';
    }
    Widget child = Container(
      height: 42,
      decoration: BoxDecoration(
        color: widget.bgColor ?? Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(_circular),
        ),
      ),
      alignment: Alignment.center,
      child: getView(buttonValue),
    );

    if (tempSecond! > 0) {
      child = Opacity(opacity: 0.5, child: child);
    }
    return InkWell(onTap: onTap, child: child);
  }

  void onTap() {
    if (tempSecond! > 0) {
      return;
    }
    if (widget.tap != null) {
      widget.tap!();
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}

// Custom VxDialog
class _VxCustomDialog extends StatelessWidget {
  final Widget child;

  const _VxCustomDialog({required this.child});

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];
    children.add(child);
    return Stack(children: children, alignment: Alignment.center);
  }
}
