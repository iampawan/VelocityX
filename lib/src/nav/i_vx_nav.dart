export 'vx_nav.dart' if (dart.library.js) 'vx_nav_web.dart';

/// Allows tests to mock browser history
abstract class HistoryProvider {
  void replaceState(dynamic data, String title, String? url);

  String get hash;
}
