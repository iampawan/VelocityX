import 'package:flutter/material.dart';
import 'package:velocity_x/src/flutter/divider.dart';

mixin VxBottomSheet {
  static Future bottomSheetOptions(BuildContext context,
      {List<String>? option,
      String? defaultData,
      double maxHeight = 0.8,
      double minHeight = 0.1,
      Function(int index, String value)? onSelect,
      bool roundedFromTop = false,
      bool isDismissible = true,
      bool enableDrag = true,
      Color? barrierColor,
      Color? backgroundColor,
      double? elevation,
      Clip? clipBehavior,
      bool isSafeAreaFromBottom = false}) async {
    final result = await showModalBottomSheet(
      context: context,
      barrierColor: barrierColor,
      elevation: elevation,
      clipBehavior: clipBehavior,
      enableDrag: enableDrag,
      shape: roundedFromTop
          ? const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)))
          : null,
      isScrollControlled: true,
      isDismissible: isDismissible,
      backgroundColor: backgroundColor ?? Theme.of(context).backgroundColor,
      builder: (BuildContext context) {
        return SafeArea(
          bottom: isSafeAreaFromBottom,
          child: AnimatedPadding(
            padding: MediaQuery.of(context).viewInsets,
            duration: const Duration(milliseconds: 100),
            child: _VxBottomSheetOptions(
              list: option,
              initData: defaultData,
              maxHeight: maxHeight,
              minHeight: minHeight,
            ),
          ),
        );
      },
    );

    if (onSelect != null && result is List) {
      onSelect(result.first, result.last);
    }
    return result;
  }

  static Future bottomSheetView(BuildContext context,
      {required Widget child,
      double maxHeight = 0.8,
      double minHeight = 0.1,
      bool roundedFromTop = false,
      bool isDismissible = true,
      bool enableDrag = true,
      Color? barrierColor,
      Color? backgroundColor,
      double? elevation,
      Clip? clipBehavior,
      bool isSafeAreaFromBottom = false}) {
    return showModalBottomSheet(
      context: context,
      barrierColor: barrierColor,
      clipBehavior: clipBehavior,
      elevation: elevation,
      enableDrag: enableDrag,
      shape: roundedFromTop
          ? const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)))
          : null,
      isScrollControlled: true,
      isDismissible: isDismissible,
      backgroundColor: backgroundColor ?? Theme.of(context).backgroundColor,
      builder: (BuildContext context) {
        return SafeArea(
          bottom: isSafeAreaFromBottom,
          child: AnimatedPadding(
            padding: MediaQuery.of(context).viewInsets,
            duration: const Duration(milliseconds: 100),
            child: _VxBottomSheetView(
              child: child,
              maxHeight: maxHeight,
              minHeight: minHeight,
            ),
          ),
        );
      },
    );
  }
}

class _VxBottomSheetOptions extends StatelessWidget {
  final List<String>? list;
  final String? initData;
  final double? maxHeight;
  final double? minHeight;

  const _VxBottomSheetOptions({
    this.list,
    this.initData,
    this.maxHeight,
    this.minHeight,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];
    children.add(contentView(context));
    children.add(bottomView(context));

    return IntrinsicHeight(child: Column(children: children));
  }

  Widget contentView(BuildContext context) {
    final List<Widget> children = [];

    for (int i = 0; i < list!.length; i++) {
      if (children.isNotEmpty) {
        children.add(const VxDivider());
      }
      final String it = list![i];
      children.add(ListTile(
        onTap: () => itemClick(context, i, it),
        title: Text(it, textAlign: TextAlign.center),
        selected: it == initData,
      ));
    }

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * (maxHeight ?? 0.8),
        minHeight: MediaQuery.of(context).size.height * (minHeight ?? 0.1),
      ),
      child: SingleChildScrollView(
        child: Column(children: children),
      ),
    );
  }

  Widget bottomView(BuildContext context) {
    final List<Widget> children = [];

    final Color effectiveColor =
        DividerTheme.of(context).color ?? Theme.of(context).dividerColor;
    children.add(Container(height: 16, color: effectiveColor));

    children.add(InkWell(
      onTap: () => close(context),
      child: Container(
        height: 42,
        child: const Text('Close'),
        alignment: Alignment.center,
      ),
    ));

    return Column(children: children);
  }

  void itemClick(BuildContext context, int index, String value) {
    close(context, result: [index, value]);
  }

  void close(BuildContext context, {var result}) {
    Navigator.pop(context, result);
  }
}

class _VxBottomSheetView extends StatelessWidget {
  final Widget? child;
  final double? maxHeight;
  final double? minHeight;

  const _VxBottomSheetView({
    this.child,
    this.maxHeight,
    this.minHeight,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * (maxHeight ?? 0.8),
        minHeight: MediaQuery.of(context).size.height * (minHeight ?? 0.1),
      ),
      child: IntrinsicHeight(child: child),
    );
  }
}
