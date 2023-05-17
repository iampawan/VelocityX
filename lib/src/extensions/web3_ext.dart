import 'dart:math';

import '../velocity_xx.dart';

mixin VxWeb3 {
  /// generate 6 digit random pin
  static String generatePin({int digits = 6}) {
    final randomMax = (pow(10, digits) - 1).toInt();
    return Random().nextInt(randomMax).toString().padLeft(digits, '0');
  }

  // Conversion to a hexadecimal string along with 0x0
  static String hexify(BigInt dec, {bool isWithPrefix = true}) {
    final res = dec.toRadixString(16);
    return isWithPrefix ? '0x0$res' : res;
  }

  /// Unit conversion: wei -> ether
  /// - bigInt has a pitfall: only x/y = double values ​​are correct
  ///
  static double toEther({
    required BigInt fromWei,
    int decimals = 18, // conversion precision digits: default eth=18
  }) {
    /// Conversion unit: 10^x power
    final unit = BigInt.from(10).pow(decimals);

    /// Conversion:
    return fromWei / unit;
  }

  /// Unit conversion:toWei
  static BigInt toWei({
    required double fromEther, // float value
    int decimals = 18, // eth default
  }) {
    /// Conversion unit: 10^x power
    final unit = BigInt.from(10).pow(decimals);

    /// Conversion:
    /// fix: from(double), it will be rounded, resulting in loss of precision, you must do multiplication first

    final ret = BigInt.from(fromEther * unit.toInt());
    Vx.log('convert to wei: fromEther: $fromEther, unit:$unit, wei:$ret');
    return ret;
  }

  /// Unit conversion:toGWei
  static BigInt toGWei({
    required double fromEther, // float value
    int decimals = 9, // eth default
  }) {
    /// Conversion unit: 10^x power
    final unit = BigInt.from(10).pow(decimals);

    /// Conversion:
    /// fix: from(double), it will be rounded, resulting in loss of precision, you must do multiplication first

    final ret = BigInt.from(fromEther * unit.toInt());
    Vx.log('convert to gwei: fromEther: $fromEther, unit:$unit, gwei:$ret');
    return ret;
  }
}

extension VxWeb3Extension on String {
  /// Takes Ethereum BigDecimal value in String and convert it
  double get getEtherValue {
    final weiBigInt = BigInt.parse(this);
// Ether has 18 decimals
    final factor = BigInt.from(10).pow(18);
// 1 ether is 10^18 wei
    final value = weiBigInt ~/ factor;
    final remainder = weiBigInt.remainder(factor);
    return value.toInt() + (remainder.toInt() / factor.toInt());
  }

  // Takes in a address "0xB2Ebc9b3a788aFB1E942eD65B59E9E49A1eE400D" and formats
  // to "OxB2E...E400D"
  String get formatCryptoAddress {
    if (length > 5) {
      final trimmedAddress = trim();
      final first = trimmedAddress.substring(0, 5);
      final last = trimmedAddress.substring(trimmedAddress.length - 5);
      return '$first...$last';
    }
    return this;
  }

  /// Remove Ox from any string
  String get strip0x {
    if (startsWith('0x', 0)) {
      return substring(2);
    }
    return this;
  }

  ///Takes the hexadecimal input and creates a BigInt.
  BigInt get hexToInt {
    return BigInt.parse(strip0x, radix: 16);
  }
}
