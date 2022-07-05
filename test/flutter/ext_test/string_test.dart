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
  });
}
