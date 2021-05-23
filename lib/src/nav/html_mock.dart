// Work-around for dart analyser issue: https://github.com/dart-lang/linter/issues/2651

final window = Window();

class Window {
  final location = Location();
  final history = History();
}

class History {
  void replaceState(dynamic data, String title, String? url) {}
}

class Location {
  final String hash = '';
}
