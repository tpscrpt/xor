import 'package:test/test.dart';
import "package:hex/hex.dart";
import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

import '../lib/xor.dart';

void main() {
  test('xor fixtures', () {
    var fixtures = jsonDecode(File('test/fixtures.json').readAsStringSync());
    for (int i = 0; i < fixtures.length; i++) {
      Uint8List a =
          Uint8List.fromList(HexDecoder().convert(fixtures[i]["a"]));
      Uint8List b =
          Uint8List.fromList(HexDecoder().convert(fixtures[i]["b"]));

      Uint8List buffer = xor(a, b);

      expect(buffer, HexDecoder().convert(fixtures[i]["expected"]));
    }
  });
}
