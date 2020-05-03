///Evaluates the function wrapping the body with try/catch and returns
///default value if error was raised or return value is null
///Originally available at https://pub.dev/packages/guard

T guard<T>(T Function() callback, [T defaultValue]) {
  T result;

  try {
    result = callback();
  } catch (err) {}

  return result ?? defaultValue;
}

Future<T> asyncGuard<T>(Future<T> Function() callback, [T defaultValue]) async {
  T result;

  try {
    result = await callback();
  } catch (err) {}

  return result ?? defaultValue;
}
