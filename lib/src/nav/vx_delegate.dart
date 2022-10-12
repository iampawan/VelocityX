import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

typedef VxPageBuilder = Page Function(Uri uri, dynamic params);

class VxNavigator extends RouterDelegate<Uri>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<Uri> {
  static VxNavConfig of(BuildContext context) {
    return (Router.of(context).routerDelegate as VxNavigator).routeManager;
  }

  @override
  final navigatorKey = GlobalKey<NavigatorState>();

  final List<VxObserver>? observers;
  late VxNavConfig routeManager;
  VxNavigator({
    required Map<Pattern, VxPageBuilder> routes,
    VxPageBuilder? notFoundPage,
    this.observers,
  }) {
    routeManager = VxNavConfig(
      routes: routes,
      pageNotFound: notFoundPage,
      observers: observers,
    );
    routeManager.addListener(notifyListeners);

    // ignore: prefer_foreach
    for (final uri in routes.keys.isNotEmpty
        ? [Uri(path: routes.keys.first.toString())]
        : [Uri(path: '/')]) {
      routeManager.push(uri);
    }
  }

  /// get the current route [Uri]
  /// this is show by the browser if your app run in the browser
  @override
  Uri? get currentConfiguration =>
      routeManager.uris.isNotEmpty ? routeManager.uris.last : null;

  /// add a new [Uri] and the corresponding [Page] on top of the navigator
  @override
  Future<void> setNewRoutePath(Uri uri) => routeManager.push(uri);

  // @override
  // Future<bool> popRoute() {
  //   return Future.value(true);
  // }

  /// Build method to set [Navigator] widget
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        for (final page in routeManager.pages) page,
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        if (routeManager.routes.isNotEmpty) {
          routeManager.removeLastUri();
          return true;
        }
        return false;
      },
      observers: observers != null
          ? [
              HeroController(),
              VxRelayingNavigatorObserver(
                () sync* {
                  yield* observers!;
                },
              )
            ]
          : [HeroController()],
    );
  }
}
