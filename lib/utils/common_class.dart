import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/utils/dimensions.dart';
import 'package:flutter_boiler_plate/utils/string_keys.dart';
import 'package:flutter_boiler_plate/utils/styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CommonClass {
  static final CommonClass _singleton = CommonClass._internal();

  factory CommonClass() {
    return _singleton;
  }

  CommonClass._internal();

  ValueNotifier<bool> hasInternet = ValueNotifier(false);

  Image assetsImageView(String image,
      {BoxFit? boxFit, double? height, double? width}) {
    return Image.asset(
      image,
      height: height,
      width: width,
      fit: boxFit,
    );
  }
  Image networkImageView(String image,
      {BoxFit? boxFit, double? height, double? width}) {
    return Image.network(
      image,
      height: height,
      width: width,
      fit: boxFit,
    );
  }

  buildMenus(IconData iconData, String heading, {bool? last}) {
    return SizedBox(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Icon(
                  iconData,
                  size: 20,
                ),
                getSizedBox(width: 10),
                Expanded(
                    child: getText(heading,
                        textStyle:
                        Styles.ralewayRegular.copyWith(fontSize: 17)))
              ],
            ),
          ),
          last == null
              ? const Divider(
            height: 1,
            color: Color(0xFF808080),
          )
              : Container(),
        ],
      ),
    );
  }
  showSnackBar(BuildContext context, String text, {Color? color}) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(backgroundColor: color, content: getText(text)));
  }

  double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  Text getText(String textString,
      {TextStyle? textStyle, TextOverflow? overflow}) {
    return Text(
      textString,
      overflow: overflow ?? TextOverflow.ellipsis,
      style: textStyle ??
          Styles.ralewayRegular.copyWith(
              fontSize: kIsWeb
                  ? Dimensions.defaultTabletFontSize
                  : Dimensions.defaultFontSize),
    );
  }

  SizedBox getSizedBox({double? height, double? width}) {
    return SizedBox(
      height: height ?? Dimensions.size0,
      width: width ?? Dimensions.size0,
    );
  }

  PreferredSizeWidget getAppBar(
      BuildContext context, GlobalKey<ScaffoldState> drawerKey, Color color,
      {bool? canGoBack}) {
    return PreferredSize(
        preferredSize: const Size.fromHeight(Dimensions.size52),
        child: AppBar(
          leading: canGoBack != null
              ? GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(FontAwesomeIcons.arrowLeftLong,
                      size: Dimensions.size18))
              : null,
          backgroundColor: color,
          title:
              getText(StringKeys.appName.tr(), textStyle: Styles.ralewayMedium),
          actions: [
            const Icon(Icons.search),
            getSizedBox(width: Dimensions.size10),
            GestureDetector(
              onTap: () {
                if (drawerKey.currentState!.isEndDrawerOpen) {
                  drawerKey.currentState!.closeEndDrawer();
                } else {
                  drawerKey.currentState!.openEndDrawer();
                }
              },
              child: const Icon(
                FontAwesomeIcons.bars,
                size: 19,
              ),
            ),
            getSizedBox(width: Dimensions.size10)
          ],
        ));
  }
}
