import 'package:flutter/foundation.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'html_mock.dart' if (dart.library.js) 'dart:html';
import 'i_vx_nav.dart';

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

  /// Attempts to guess the current URL strategy based on whether a hash is set
  /// or not. This is to deal with users directly setting the URL strategy.
  static void _setDefaultUrlStrategy() {
    historyProvider ??= BrowserHistoryProvider();
    _urlStrategy = historyProvider!.hash.isNotEmpty
        ? const HashUrlStrategy()
        : PathUrlStrategy();
  }

  /// Allows tests to mock browser history
  @visibleForTesting
  static HistoryProvider? historyProvider;

  static void replaceUrl(Uri route) {
    historyProvider ??= BrowserHistoryProvider();
    historyProvider!.replaceState(
      null,
      '',
      makeUrl(
        path: route.path,
        queryParameters: route.queryParameters,
      ),
    );
  }

  static String makeUrl({
    required String path,
    Map<String, String>? queryParameters,
  }) {
    final hasQueryParameters = queryParameters?.isNotEmpty == true;
    final url = Uri(
      path: path,
      queryParameters: hasQueryParameters ? queryParameters : null,
    );

    if (_urlStrategy == null) {
      _setDefaultUrlStrategy();
    }

    return _urlStrategy!.prepareExternalUrl(url.toString());
  }
}

class BrowserHistoryProvider implements HistoryProvider {
  @override
  void replaceState(dynamic data, String title, String? url) {
    window.history.replaceState(data, title, url);
  }

  @override
  String get hash => window.location.hash;
}
