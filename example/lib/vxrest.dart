// import 'dart:io';

// import 'package:velocity_x/velocity_x_rest.dart';

// Future<void> restOperations() async {
//   /// Registering routes
//   VxRest.auto('/', 'Hello world');
//   VxRest.get(
//       '/index.html',
//       File(
//           'Users/thepawankumar/Desktop/dev/flutterdev/packages/VelocityX/example/lib/html/index.html'));
//   VxRest.get('/testroute', () {
//     return 'some function';
//   });
//   VxRest.get('/testjson', () {
//     return VxRest.encodeJson({
//       'msg': 'Test Json',
//       'list': [0, 1, 2]
//     });
//   });

//   /// Listen to server
//   await VxRest.listen(host: '0.0.0.0', port: 4040);

//   /// Open http://127.0.0.1:4040/ on browser
// }
