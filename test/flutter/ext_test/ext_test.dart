import 'package:flutter_test/flutter_test.dart';
import 'package:velocity_x/src/extensions/web3_ext.dart';

void main() {
  group('Web3 Extensions', () {
    test('Check Ethereum converter', () {
      final value = '17500000000000000000'.getEtherValue;
      expect(17.5, value);
    });

    test('Format Crypto Address', () {
      final value =
          '0x8b40f191015D205F4acFDA1861d4CF17794BA245'.formatCryptoAddress;
      expect("0x8b4...BA245", value);
    });
    test('Test Strip 0x', () {
      final value = '0x8b40f191015D205F4acFDA1861d4CF17794BA245'.strip0x;
      expect("8b40f191015D205F4acFDA1861d4CF17794BA245", value);
    });

    test('Generate n digits pin', () {
      const digits = 4;
      final value = VxWeb3.generatePin(digits: digits);
      expect(digits, value.length);
    });

    test('Hexify', () {
      final value = VxWeb3.hexify(BigInt.from(1000000000000000));
      expect(0x038d7ea4c68000, value.hexToInt.toInt());
    });

    test('toEther', () {
      final value = VxWeb3.toEther(
        fromWei: BigInt.from(1000000000000000),
      );
      expect(0.001, value);
    });

    test('toWei', () {
      final value = VxWeb3.toWei(fromEther: 0.001);
      expect(BigInt.from(1000000000000000), value);
    });

    test('toGWei', () {
      final value = VxWeb3.toGWei(fromEther: 0.001);
      expect(BigInt.from(1000000), value);
    });
  });
}
