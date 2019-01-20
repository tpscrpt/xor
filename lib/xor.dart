library xor;

import 'dart:typed_data';

List<int> xor(ByteData a, ByteData b) {
  if (a.lengthInBytes == 0 || b.lengthInBytes == 0) {
    throw ArgumentError.value(
        "lengthInBytes of ByteData arguments must be > 0");
  }

  bool aIsBigger = a.lengthInBytes > b.lengthInBytes;

  int length = aIsBigger ? a.lengthInBytes : b.lengthInBytes;

  List<int> buffer = List.filled(length, 0);

  print(a.elementSizeInBytes);

  for (int i = 0; i < length; i++) {
    var aa, bb;
    try {
      aa = a.getUint8(i);
    } catch (e) {
      aa = 0;
    }
    try {
      bb = b.getUint8(i);
    } catch (e) {
      bb = 0;
    }

    buffer[i] = aa ^ bb;
  }

  return buffer;
}
