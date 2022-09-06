import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray501 = fromHex('#b5a8a8');

  static Color gray600 = fromHex('#7d7070');

  static Color gray700 = fromHex('#5c5252');

  static Color gray400 = fromHex('#c4c4c4');

  static Color gray500 = fromHex('#b5a6a6');

  static Color gray901 = fromHex('#212121');

  static Color gray900 = fromHex('#1c1f30');

  static Color lightBlue802 = fromHex('#0070b5');

  static Color lightBlue801 = fromHex('#007ac7');

  static Color gray100 = fromHex('#f5f5f5');

  static Color lightBlue800 = fromHex('#0078bf');

  static Color black90021 = fromHex('#21000000');

  static Color black900 = fromHex('#000000');

  static Color bluegray400 = fromHex('#888888');

  static Color yellow900 = fromHex('#f08a26');

  static Color whiteA700 = fromHex('#ffffff');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
