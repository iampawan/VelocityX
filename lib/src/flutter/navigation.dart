import 'package:flutter/material.dart';

/// VxAdaptiveNavigation is a wigdet which can be used for navigation throughout
/// the app. On Small screen it use NavigationBar and on Large screen it use
/// NavigationRail.
class VxAdaptiveNavigation extends StatelessWidget {
  const VxAdaptiveNavigation({
    super.key,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.child,
    this.backgroundColor,
    this.elevation,
    this.useIndicator,
    this.indicatorColor,
    this.indicatorShape,
  });

  final List<NavigationDestination> destinations;
  final int selectedIndex;
  final void Function(int index) onDestinationSelected;
  final Widget child;
  final Color? backgroundColor;
  final double? elevation;
  final bool? useIndicator;
  final Color? indicatorColor;
  final ShapeBorder? indicatorShape;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, dimens) {
        // Tablet Layout
        if (dimens.maxWidth >= 600) {
          return Scaffold(
            body: Row(
              children: [
                NavigationRail(
                  key: key,
                  backgroundColor: backgroundColor,
                  indicatorShape: indicatorShape,
                  elevation: elevation,
                  useIndicator: useIndicator,
                  indicatorColor: indicatorColor,
                  extended: dimens.maxWidth >= 800,
                  minExtendedWidth: 180,
                  destinations: destinations
                      .map((e) => NavigationRailDestination(
                            icon: e.icon,
                            label: Text(e.label),
                          ))
                      .toList(),
                  selectedIndex: selectedIndex,
                  onDestinationSelected: onDestinationSelected,
                ),
                Expanded(child: child),
              ],
            ),
          );
        }
        // Mobile Layout
        return Scaffold(
          body: child,
          bottomNavigationBar: NavigationBar(
            key: key,
            backgroundColor: backgroundColor,
            indicatorColor: indicatorColor,
            indicatorShape: indicatorShape,
            elevation: elevation,
            destinations: destinations,
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
          ),
        );
      },
    );
  }
}
