import 'dart:async';
import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'i_vx_nav.dart';

/// allow you to interact with the List of [pages]
class VxNavConfig extends ChangeNotifier {
  VxNavConfig({required this.routes, this.pageNotFound, this.observers});

  final Map<Pattern, VxPageBuilder> routes;
  final VxPageBuilder? pageNotFound;
  final List<VxObserver>? observers;

  final _pages = <Page>[];
  final _uris = <Uri>[];

  /// give you a read only access
  /// to the [List] of [Page] you have in your navigator
  List<Page> get pages => UnmodifiableListView(_pages);

  /// give you a read only access
  /// to the [List] of [Uri] you have in your navigator
  List<Uri> get uris => UnmodifiableListView(_uris);
  Completer<dynamic>? _boolResultCompleter;

  Future<void> _setNewRoutePath(Uri uri, dynamic params) {
    bool _findRoute = false;
    for (var i = 0; i < routes.keys.length; i++) {
      final key = routes.keys.elementAt(i);
      if (key.matchAsPrefix(uri.path)?.group(0) == uri.path) {
        if (_uris.contains(uri) && key == routes.keys.first) {
          _findRoute = true;
          break;
        }
        _pages.add(routes[key]!(uri, params));
        _uris.add(uri);
        if (observers != null) {
          for (final observer in observers!) {
            observer.didChangeRoute(uri, routes[key]!(uri, params), "push");
          }
        }
        _findRoute = true;
        break;
      }
    }
    if (!_findRoute) {
      var page = pageNotFound?.call(uri, params);
      page ??= MaterialPage(
        child: Scaffold(
          body: Container(
            child: const Center(
              child: Text('Page not found'),
            ),
          ),
        ),
      );
      _pages.add(page);
      _uris.add(uri);
      if (observers != null) {
        for (final observer in observers!) {
          observer.didChangeRoute(uri, page, "push");
        }
      }
    }

    notifyListeners();

    return SynchronousFuture(null);
  }

  /// Push an [Uri]
  Future<void> push(Uri uri, {dynamic params}) => _setNewRoutePath(uri, params);

  /// replace
  Future<void> replace(Uri uri, {dynamic params}) {
    _pages.removeLast();
    _uris.removeLast();
    // Set the URL directly
    if (kIsWeb) {
      VxNav.replaceUrl(uri);
    }
    return push(uri, params: params);
  }

  /// pop
  void pop() {
    if (_pages.length > 1) {
      removeLastUri();
    } else {
      print('Cannot pop');
    }
  }

  /// clear the list of [pages] and then push an [Uri]
  Future<void> clearAndPush(Uri uri, {dynamic params}) {
    _pages.clear();
    _uris.clear();
    if (kIsWeb) {
      VxNav.replaceUrl(uri);
    }
    return push(uri, params: params);
  }

  /// Push multiple [Uri] at once
  Future<void> pushAll(List<Uri> uris, {List<dynamic>? params}) async {
    int index = 0;
    for (final uri in uris) {
      // ignore: unnecessary_type_check
      if (params != null && params is List) {
        await push(uri, params: params[index]);
      } else {
        await push(uri);
      }
      index++;
    }
  }

  /// clear the list of [pages] and then push multiple [Uri] at once
  Future<void> clearAndPushAll(List<Uri> uris, {List<dynamic>? params}) {
    _pages.clear();
    _uris.clear();
    if (kIsWeb) {
      VxNav.replaceUrl(uris.first);
    }
    return pushAll(uris, params: params);
  }

  /// remove a specific [Uri] and the corresponding [Page]
  void removeUri(Uri uri) {
    final index = _uris.lastIndexOf(uri);
    if (index != -1) {
      final page = _pages.removeAt(index);
      final uri = _uris.removeAt(index);
      if (kIsWeb) {
        VxNav.replaceUrl(uri);
      }
      if (observers != null) {
        for (final observer in observers!) {
          observer.didChangeRoute(uri, page, "pop");
        }
      }
      notifyListeners();
    }
  }

  /// remove the last [Uri] and the corresponding [Page]
  void removeLastUri() {
    final page = _pages.removeLast();
    final uri = _uris.removeLast();
    if (kIsWeb) {
      VxNav.replaceUrl(uri);
    }
    if (observers != null) {
      for (final observer in observers!) {
        observer.didChangeRoute(uri, page, "pop");
      }
    }
    notifyListeners();
  }

  /// Simple method to use instead of `await Navigator.push(context, ...)`
  /// The result can be set either by [returnWith]
  Future<dynamic> waitAndPush(Uri uri, {dynamic params}) async {
    _boolResultCompleter = Completer<dynamic>();
    await push(uri, params: params);
    notifyListeners();
    return _boolResultCompleter!.future;
  }

  /// This is custom method to pass returning value
  /// while popping the page. It can be considered as an example
  void returnAndPush(dynamic value) {
    if (_boolResultCompleter != null) {
      _pages.removeLast();
      _uris.removeLast();
      if (_uris.length == 1) {
        _boolResultCompleter!.complete(value);
      }
      notifyListeners();
    }
  }

  /// remove the pages and go root page
  void popToRoot() {
    _pages.removeRange(1, _pages.length);
    _uris.removeRange(1, _uris.length);
    if (kIsWeb) {
      VxNav.replaceUrl(uris.first);
    }
    if (observers != null) {
      for (final observer in observers!) {
        observer.didChangeRoute(_uris.first, _pages.first, "pop");
      }
    }
    notifyListeners();
  }
}
