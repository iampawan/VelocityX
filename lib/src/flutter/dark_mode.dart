import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

enum VxThemeMode { light, dark }

class VxDarkModeMutation extends VxMutation {
  final bool isDarkMode;

  VxDarkModeMutation(this.isDarkMode);
  @override
  void perform() {
    VxAppData().isDarkMode = isDarkMode;
  }
}

class VxDarkModeButton extends StatelessWidget {
  const VxDarkModeButton(
      {super.key,
      this.style,
      this.showSelectedIcon = false,
      this.showSingleIcon = false});

  final ButtonStyle? style;
  final bool showSelectedIcon;
  final bool showSingleIcon;

  @override
  Widget build(BuildContext context) {
    VxThemeMode theme =
        VxAppData().isDarkMode ? VxThemeMode.dark : VxThemeMode.light;
    VxState.watch(context, on: [VxDarkModeMutation]);
    return showSingleIcon
        ? IconButton(
            icon: Icon(
              VxAppData().isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: () {
              VxDarkModeMutation(!VxAppData().isDarkMode);
            },
          )
        : SegmentedButton(
            style: style,
            selected: <VxThemeMode>{theme},
            onSelectionChanged: (themeSet) {
              theme = themeSet.first;
              VxDarkModeMutation(theme == VxThemeMode.dark);
            },
            showSelectedIcon: showSelectedIcon,
            segments: const [
              ButtonSegment(
                  value: VxThemeMode.light, icon: Icon(Icons.light_mode)),
              ButtonSegment(
                  value: VxThemeMode.dark, icon: Icon(Icons.dark_mode))
            ],
          );
  }
}
