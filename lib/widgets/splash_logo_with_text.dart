import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/utils/common_class.dart';
import 'package:flutter_boiler_plate/utils/common_paths.dart';
import 'package:flutter_boiler_plate/utils/dimensions.dart';

import '../utils/string_keys.dart';

class SplashLogoWithName extends StatelessWidget {
  final CommonClass _commonClass = CommonClass();
  final CommonPaths _commonPaths = CommonPaths();

  SplashLogoWithName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _commonClass.getScreenWidth(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _commonClass.assetsImageView(_commonPaths.logoWithoutName,width: 100,height: 100),
          _commonClass.getSizedBox(height:Dimensions.size20),
          _commonClass.getText(
              StringKeys.appName.tr(), ),
        ],
      ),
    );
  }
}
