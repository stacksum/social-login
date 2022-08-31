import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/utils/common_class.dart';
import 'package:flutter_boiler_plate/utils/custom_colors.dart';
import 'package:flutter_boiler_plate/utils/dimensions.dart';

import '../utils/string_keys.dart';
import '../utils/styles.dart';

class SplashVersionName extends StatelessWidget {
  final CommonClass _commonClass = CommonClass();
  final CustomColors _customColors = CustomColors();

  SplashVersionName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Dimensions.size20,
        width: _commonClass.getScreenWidth(context),
        child: Center(
            child: _commonClass.getText(
                StringKeys.appVersion,
                textStyle: Styles.ralewayBlack
                    .copyWith(color: _customColors.mainBrandColor))));
  }
}
