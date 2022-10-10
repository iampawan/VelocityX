import 'package:flutter_test/flutter_test.dart';
import 'package:velocity_x/src/extensions/string_ext.dart';

void main() {
  group("String extension test", () {
    test('isNumber Extension', () {
      expect("0".isNumber(), true);
      expect("1".isNumber(), true);
      expect("2".isNumber(), true);
      expect("3".isNumber(), true);
      expect("4".isNumber(), true);
      expect("5".isNumber(), true);
      expect("6".isNumber(), true);
      expect("7".isNumber(), true);
      expect("8".isNumber(), true);
      expect("9".isNumber(), true);
      expect("65464444".isNumber(), true);
      expect("-65464444".isNumber(), true);
      expect("-65464444.65464444".isNumber(), true);
      expect('abc'.isNumber(), false);
    });
    test('isDigit', () {
      expect("0".isDigit(), true);
      expect("1".isDigit(), true);
      expect("2".isDigit(), true);
      expect("3".isDigit(), true);
      expect("4".isDigit(), true);
      expect("5".isDigit(), true);
      expect("6".isDigit(), true);
      expect("7".isDigit(), true);
      expect("8".isDigit(), true);
      expect("9".isDigit(), true);
      expect("10".isDigit(), false);
      expect("-9".isDigit(), false);
      expect("-10".isDigit(), false);
      expect("abc".isDigit(), false);
    });
  });
}
