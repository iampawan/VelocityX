import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  group("Group of utilities", () {
    test("Test for Hex To Color", () {
      final color = Vx.hexToColor("#ffffff");
      expect(const Color(0xffffffff), color);
    });

    test("Test for Hex to Ascii", () {
      const String hexString = "687474703a2f2f636f64657075722e646576";
      final ascii = Vx.hexToAscii(hexString);
      expect("http://codepur.dev", ascii);
    });
  });
}
