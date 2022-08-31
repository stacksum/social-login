import 'package:flutter/widgets.dart';
import 'package:flutter_boiler_plate/utils/dimensions.dart';
import 'package:flutter_boiler_plate/utils/string_keys.dart';

class Styles {
  static const TextStyle ralewayThin = TextStyle(
      fontSize: Dimensions.defaultFontSize,
      fontFamily: StringKeys.ralewayThin,
      fontWeight: FontWeight.w200);

  static const TextStyle ralewayLight = TextStyle(
      fontSize: Dimensions.defaultFontSize,
      fontWeight: FontWeight.w400,
      fontFamily: StringKeys.ralewayLight);

  static const TextStyle ralewayRegular = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: Dimensions.defaultFontSize,
      fontFamily: StringKeys.ralewayRegular);

  static const TextStyle ralewayMedium = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: Dimensions.defaultFontSize,
      fontFamily: StringKeys.ralewayMedium);

  static const TextStyle ralewayBlack = TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: Dimensions.defaultFontSize,
      fontFamily: StringKeys.ralewayBlack);
  static const TextStyle ralewayBold = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: Dimensions.defaultFontSize,
      fontFamily: StringKeys.ralewayBold);
}
