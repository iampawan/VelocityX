import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:velocity_x/velocity_x.dart';

extension VxGlobalKeyExtension on GlobalKey {
  /// screenshot
  /// format image format
  /// pixelRatio screenshot resolution ratio
  Future<ByteData?> screenshots(
      {ui.ImageByteFormat? format, double? pixelRatio}) async {
    final RenderRepaintBoundary boundary =
        currentContext!.findRenderObject() as RenderRepaintBoundary;
    final ui.Image image = await boundary.toImage(
        pixelRatio: pixelRatio ??
            WidgetsBinding
                .instance.platformDispatcher.implicitView!.devicePixelRatio);
    final ByteData? byteData =
        await image.toByteData(format: format ?? ui.ImageByteFormat.rawRgba);

    /// Uint8List uint8list = byteData.buffer.asUint8List();
    return byteData;
  }
}

Map<int, bool> _vxfuncThrottle = {};

extension VxFutureFunctionExtension on Future Function() {
  /// Throttle function
  /// When an event is triggered, the target operation is executed immediately, and then the event is only responded to after the asynchronous method completes execution.
  Function throttle() {
    bool enable = _vxfuncThrottle[hashCode] ?? true;
    void func() {
      if (enable) {
        _vxfuncThrottle[hashCode] = false;
        this.call().then((_) {
          _vxfuncThrottle[hashCode] = false;
        }).whenComplete(() {
          _vxfuncThrottle.remove(hashCode);
        });
      }
    }

    func();
    return func;
  }
}

extension VxFunctionExtension on Function {
  /// Function debounce
  /// When an event is triggered, the target operation is not executed immediately. Instead, a delayed time is given. If another event is triggered within that time range, the delay time is reset. The target operation is executed only after the delay time expires.
  /// For example, if the delay time is set to 1000ms:
  /// If no event is triggered within 1000ms, the target operation is executed.
  /// If another event is triggered within 1000ms, the delay time is reset, and the target operation is executed after another 1000ms delay.
  Function() debounce([Duration delay = const Duration(seconds: 1)]) {
    Timer? timer;
    return () {
      if (timer?.isActive ?? false) timer?.cancel();
      timer = Timer(delay, () => this.call());
    };
  }

  /// Throttle function
  /// When an event is triggered, the target operation is executed immediately. At the same time, a delayed time is given. If another event is triggered within that time range, the event is ignored and not processed until an event is triggered after the specified time range.
  /// For example, if the delay time is set to 1000ms:
  /// If another event is triggered within 1000ms, the event is ignored.
  /// If the delay of 1000ms expires, the event is not ignored, and the target operation is executed immediately. Then, another 1000ms delay is started.
  Function() throttle([Duration delay = const Duration(seconds: 1)]) {
    bool enable = _vxfuncThrottle[hashCode] ?? true;
    return () {
      if (enable) {
        _vxfuncThrottle[hashCode] = false;
        this.call();
        delay.delayed(() {
          _vxfuncThrottle.remove(hashCode);
        });
      }
    };
  }
}

extension VxDurationExtension on Duration {
  /// final _delay = 3.seconds;
  /// print('+ wait $_delay');
  /// await _delay.delayed();
  /// print('- finish wait $_delay');
  /// print('+ callback in 700ms');
  Future<T> delayed<T>([FutureOr<T> Function()? callback]) =>
      Future<T>.delayed(this, callback);

  /// Timer
  Timer timer([Function? function]) {
    late Timer timer;
    timer = Timer(this, () {
      if (function != null) function.call();
      timer.cancel();
    });
    return timer;
  }

  /// Periodic Timer
  Timer timerPeriodic(void Function(Timer timer) callback) =>
      Timer.periodic(this, (Timer time) => callback(time));
}

extension VxColorExtension on Color {
  /// Returns a MaterialColor based on the current color.
  MaterialColor materialColor() => Vx.getMaterialColor(this);

  /// whether the color is transparent or not
  bool get isTransparent => alpha == 0;

  /// Get the swatch of the color
  MaterialColor get swatch =>
      Colors.primaries.firstWhere((Color c) => c.value == value,
          orElse: () => MaterialColor(value, getMaterialColorValues));

  /// Get MaterialColor values from the current color
  Map<int, Color> get getMaterialColorValues => {
        50: _swatchShade(50),
        100: _swatchShade(100),
        200: _swatchShade(200),
        300: _swatchShade(300),
        400: _swatchShade(400),
        500: _swatchShade(500),
        600: _swatchShade(600),
        700: _swatchShade(700),
        800: _swatchShade(800),
        900: _swatchShade(900),
      };

  /// Get the shade of the color
  Color _swatchShade(int swatchValue) => HSLColor.fromColor(this)
      .withLightness(1 - (swatchValue / 1000))
      .toColor();

  /// Get the color with brightness of the current color
  Color get withBrightness {
    final Brightness brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    if (brightness == Brightness.light) {
      return this;
    } else {
      return getMaterialColorValues[800]!;
    }
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` and returns the hexadecimal string value of the color.
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
