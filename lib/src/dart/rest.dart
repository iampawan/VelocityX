// import 'dart:convert';
// import 'dart:io';

// import 'package:mime/mime.dart';

// import '../../velocity_x.dart';

// class VxRest {
//   static String version = 'Vx';
//   static String autoKey = 'VXAUTO';

//   static Map success(dynamic s, {dynamic msg = 'success'}) =>
//       {'msg': msg, 'code': 1, 'result': s};

//   static bool isSuccess(dynamic o) =>
//       o != null && o is Map && o.containsKey('code') && o['code'] == 1;

//   static Map error(dynamic s, {dynamic msg = 'error'}) =>
//       {'msg': msg, 'code': -1, 'result': s};

//   static bool isError(dynamic o) => !isSuccess(o);

//   VxRest(this.req);

//   static HttpServer? _currentServer;

//   HttpRequest? req;

//   bool get isPost => method == 'POST';

//   bool get isGet => method == 'GET';

//   Uri get uri => req!.requestedUri;

//   String get ip => req!.connectionInfo!.remoteAddress.host;

//   int get port => req!.connectionInfo!.remotePort;

//   String get method => req!.method;

//   HttpResponse get res => req!.response;

//   Future<void> handle() async {
//     try {
//       headers['Server'] = '${headers['Server']}-$version';
//       headers.forEach(res.headers.set);
//       final dynamic body = match(method, uri);
//       write(await callable(body));
//     } catch (e, t) {
//       VxRest.logger(e);
//       VxRest.logger(t);
//       write(VxRest.error(e, msg: 'Server Error!'));
//     }
//     close();
//   }

//   void write(dynamic body) {
//     if (body == null) {
//       res.write('');
//     } else if (body is String) {
//       res.write(body);
//     } else if (body is List<int>) {
//       res.add(body);
//     } else if (body is Map) {
//       res.write(encodeJson(body));
//     } else {
//       throw ArgumentError(
//           'Invalid response body.runtimeType "${body.runtimeType}".');
//     }
//   }

//   static void get(pattern, function) => route('get', pattern, function);

//   static void post(pattern, function) => route('post', pattern, function);

//   static void auto(pattern, function) => route(autoKey, pattern, function);

//   static void put(pattern, function) => route('put', pattern, function);

//   static void delete(pattern, function) => route('delete', pattern, function);

//   static void option(pattern, function) => route('option', pattern, function);

//   static Map<String, dynamic> routeMap = {};
//   static Map<String, String> headers = {
//     'Server': 'VxRest',
//     'Server-Pub': 'https://pub.dev/packages/velocity_x',
//     'Access-Control-Allow-Origin': '*',
//     'Access-Control-Allow-Methods': '*',
//     'Access-Control-Allow-Headers': '*',
//     'Content-Type': 'application/json; charset=utf-8',
//   };

//   /// Register route to routeMap
//   static void route(String method, dynamic pattern, dynamic function) {
//     method = method.toUpperCase();
//     if (!routeMap.containsKey(method)) {
//       routeMap[method] = <dynamic, dynamic>{};
//     }
//     routeMap[method][pattern] = function;
//   }

//   ///Route matcher
//   static dynamic match(String key, Uri uri) {
//     final path = uri.path.isEmpty ? '/' : uri.path;
//     dynamic routes = Map.from(routeMap[autoKey] ?? {});
//     if (routes.containsKey(path)) {
//       return routes[path];
//     }
//     routes = Map.from(routeMap[key] ?? {});
//     if (routes.containsKey(path)) {
//       return routes[path];
//     }
//     return VxRest.error(null, msg: 'Not found path:$path');
//   }

//   ///User can extend this method
//   dynamic callable(dynamic body) async {
//     if (body is Function()) {
//       return await body();
//     } else if (body is Function(VxRest)) {
//       return await body(this);
//     } else if (body is Function(Uri)) {
//       return await body(uri);
//     } else if (body is Function(HttpRequest, HttpResponse)) {
//       return await body(req!, res);
//     } else if (body is Function(HttpRequest)) {
//       return await body(req!);
//     } else if (body is Function(HttpResponse)) {
//       return await body(res);
//     } else if (body is File) {
//       if (body.existsSync()) {
//         final mimeType =
//             lookupMimeType(body.path) ?? 'text/plain; charset=UTF-8';
//         res.headers.set('Content-Type', mimeType);
//         await body.openRead().pipe(res);
//         return null;
//       }
//       return VxRest.error('body not body.exists');
//     }
//     return body;
//   }

//   static Future<void> listen({int port = 4040, String host = '0.0.0.0'}) async {
//     final server = await HttpServer.bind(host, port);
//     _currentServer = server;
//     logger('Listening on http://$host:$port/');
//     await for (final HttpRequest request in server) {
//       logger(request.requestedUri);
//       await VxRest(request).handle();
//     }
//   }

//   static Future<void> closeServer() async {
//     if (_currentServer != null) {
//       _currentServer!.close(force: true);
//     }
//   }

//   static Future<void> restartServer(
//       {int port = 4040, String host = '0.0.0.0'}) async {
//     if (_currentServer != null) {
//       await closeServer();
//       await listen(port: port, host: host);
//     }
//   }

//   static String encodeJson(dynamic input) =>
//       jsonEncode(input, toEncodable: (o) => o.toString());

//   ///User can customize this function for db or any file to output the log message
//   static Function(dynamic) logger = ([o]) async => print('VxRest $o');

//   Future close() async {
//     try {
//       await res.close();
//     } catch (e) {
//       Vx.log(e.toString());
//     }
//   }
// }
