import 'package:flutter/material.dart';

class CustomColors {
  static final CustomColors _singleton = CustomColors._internal();

  factory CustomColors() {
    return _singleton;
  }
  final Color mainBrandColor = const Color(0xFFF04A37);
  final Color secondBrandColor = const Color(0xFF989898);
  final Color thirdBrandColor = const Color(0xFF010101);
  final Color whiteColor = const Color(0xFFFFFFFF);
  final Color greyColor = const Color(0xFF808080);
  final Color blackColor = const Color(0xFF000000);
  final Color transparentColor = const Color(0x00000000);

  CustomColors._internal();
}
