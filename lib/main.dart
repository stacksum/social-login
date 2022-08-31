import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/utils/common_class.dart';
import 'package:flutter_boiler_plate/utils/custom_colors.dart';
import 'package:flutter_boiler_plate/utils/my_shared_preference.dart';
import 'package:flutter_boiler_plate/utils/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_boiler_plate/utils/string_keys.dart';
import 'package:flutter_boiler_plate/views/screens/profile_folder/profile_screen.dart';
import 'package:flutter_boiler_plate/views/screens/sign_in_folder/sign_in_screen.dart';
import 'package:flutter_boiler_plate/views/screens/sign_up_folder/sign_up_screen.dart';
import 'package:flutter_boiler_plate/views/screens/splash_folder/splash_screen.dart';
import 'package:shared_value/shared_value.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(supportedLocales: [
      Locale(StringKeys.en, StringKeys.us),
      Locale(StringKeys.hi, StringKeys.india)
    ], path: 'assets/translations', child:   SharedValue.wrapApp(MyApp())
        ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late StreamSubscription<ConnectivityResult> _streamSubscription;
  final CommonClass _commonClass = CommonClass();
  final CustomColors _customColors=CustomColors();

  @override
  void initState() {
    isLoggedIn.load();

    userName.load();
    userPic.load();
    userEmail.load();
    loginType.load();
    _streamSubscription = Connectivity().onConnectivityChanged.listen((event) {
      if (event != ConnectivityResult.none) {
        _commonClass.hasInternet.value = true;
      } else {
        _commonClass.hasInternet.value = false;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringKeys.appName,
      theme: ThemeData(
        primaryColor: _customColors.mainBrandColor,

      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: Routes.splashScreenRoute,
      routes: {
        Routes.splashScreenRoute: (context) => const SplashScreen(),
        Routes.signInScreenRoute: (context) => const SignInScreen(),
        Routes.signUpScreenRoute: (context) => const SignUpScreen(),
        Routes.profileScreenRoute: (context) => const ProfileScreen(),
      },
    );
  }
}
