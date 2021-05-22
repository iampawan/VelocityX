import 'dart:async';
import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/src/nav/vx_delegate.dart';

/// allow you to interact with the List of [pages]
class VxNavConfig extends ChangeNotifier {
  VxNavConfig({required this.routes, this.pageNotFound});

  final Map<String, VxPageBuilder> routes;
  final VxPageBuilder? pageNotFound;

  final _pages = <Page>[];
  final _uris = <Uri>[];

  /// give you a read only access
  /// to the [List] of [Page] you have in your navigator
  List<Page> get pages => UnmodifiableListView(_pages);

  /// give you a read only access
  /// to the [List] of [Uri] you have in your navigator
  List<Uri> get uris => UnmodifiableListView(_uris);
  late Completer<dynamic> _boolResultCompleter;

  Future<void> _setNewRoutePath(Uri uri, dynamic params) {
    bool _findRoute = false;
    for (var i = 0; i < routes.keys.length; i++) {
      final key = routes.keys.elementAt(i);
      if (key == uri.path) {
        if (_uris.contains(uri)) {
          final position = _uris.indexOf(uri);
          final _urisLengh = _uris.length;
          for (var start = position; start < _urisLengh - 1; start++) {
            _pages.removeLast();
            _uris.removeLast();
          }
          _findRoute = true;
          break;
        }
        _pages.add(routes[key]!(uri, params));
        _uris.add(uri);
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
    return push(uri, params: params);
  }

  /// Push multiple [Uri] at once
  Future<void> pushAll(List<Uri> uris, {List<dynamic>? params}) async {
    int index = 0;
    for (final uri in uris) {
      if (params is List) {
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
    return pushAll(uris, params: params);
  }

  /// remove a specific [Uri] and the corresponding [Page]
  void removeUri(Uri uri) {
    final index = _uris.indexOf(uri);
    _pages.removeAt(index);
    _uris.removeAt(index);
    notifyListeners();
  }

  /// remove the last [Uri] and the corresponding [Page]
  void removeLastUri() {
    _pages.removeLast();
    _uris.removeLast();
    notifyListeners();
  }

  /// Simple method to use instead of `await Navigator.push(context, ...)`
  /// The result can be set either by [returnWith]
  Future<dynamic> waitAndPush(Uri uri, {dynamic params}) async {
    _boolResultCompleter = Completer<dynamic>();
    await push(uri, params: params);
    notifyListeners();
    return _boolResultCompleter.future;
  }

  /// This is custom method to pass returning value
  /// while popping the page. It can be considered as an example
  void returnAndPush(dynamic value) {
    _pages.removeLast();
    _uris.removeLast();
    _boolResultCompleter.complete(value);
    notifyListeners();
  }

  /// remove the pages and go root page
  void popToRoot() {
    _pages.removeRange(1, _pages.length);
    _uris.removeRange(1, _uris.length);
    notifyListeners();
  }
}
