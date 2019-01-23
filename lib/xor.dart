library xor;

import 'dart:typed_data';

Uint8List xor(Uint8List a, Uint8List b) {
  if (a.lengthInBytes == 0 || b.lengthInBytes == 0) {
    throw ArgumentError.value(
        "lengthInBytes of Uint8List arguments must be > 0");
  }

  bool aIsBigger = a.lengthInBytes > b.lengthInBytes;
  int length = aIsBigger ? a.lengthInBytes : b.lengthInBytes;

  Uint8List buffer = Uint8List(length);

  for (int i = 0; i < length; i++) {
    var aa, bb;
    try {
      aa = a.elementAt(i);
    } catch (e) {
      aa = 0;
    }
    try {
      bb = b.elementAt(i);
    } catch (e) {
      bb = 0;
    }

    buffer[i] = aa ^ bb;
  }

  return buffer;
}
