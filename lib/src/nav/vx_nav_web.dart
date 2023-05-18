import 'package:flutter_web_plugins/flutter_web_plugins.dart';

mixin VxNav {
  static HashUrlStrategy? _urlStrategy;

  static void setPathUrlStrategy() {
    _urlStrategy = PathUrlStrategy();
    setUrlStrategy(_urlStrategy);
  }

  static void setHashUrlStrategy() {
    _urlStrategy = const HashUrlStrategy();
    setUrlStrategy(_urlStrategy);
  }
}
