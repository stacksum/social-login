import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/utils/custom_colors.dart';
import 'package:flutter_boiler_plate/utils/my_shared_preference.dart';
import 'package:flutter_boiler_plate/utils/routes.dart';
import 'package:flutter_boiler_plate/utils/string_keys.dart';
import 'package:flutter_boiler_plate/widgets/splash_logo_with_text.dart';
import 'package:flutter_boiler_plate/widgets/splash_version_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final CustomColors _customColors = CustomColors();
  late Timer timer;

  @override
  void initState() {

    timer = Timer.periodic(Duration(seconds: StringKeys.splashTime), (timer) {
      if (timer.tick > StringKeys.splashTime) {
        timer.cancel();

        if( isLoggedIn.$)
          {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.profileScreenRoute, (context) => false);
          }else{
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.signInScreenRoute, (context) => false);
        }

      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _customColors.whiteColor,
        bottomNavigationBar: SplashVersionName(),
        body: SplashLogoWithName());
  }
}
