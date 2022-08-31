import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/utils/common_class.dart';
import 'package:flutter_boiler_plate/utils/common_paths.dart';
import 'package:flutter_boiler_plate/utils/custom_colors.dart';
import 'package:flutter_boiler_plate/utils/dimensions.dart';
import 'package:flutter_boiler_plate/utils/my_shared_preference.dart';
import 'package:flutter_boiler_plate/utils/routes.dart';
import 'package:flutter_boiler_plate/utils/string_keys.dart';
import 'package:flutter_boiler_plate/utils/styles.dart';
import 'package:flutter_boiler_plate/widgets/common_button.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final CommonClass _commonClass = CommonClass();
  final CommonPaths _commonPaths = CommonPaths();
  final CustomColors _customColors = CustomColors();
@override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          color: _customColors.whiteColor,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: _customColors.mainBrandColor, width: 0.5)),
                      child: ClipOval(
                          child: userPic.$.isEmpty
                              ? _commonClass.assetsImageView(
                                  _commonPaths.testingImage,
                                  height: 100,
                                  width: 100,
                                  boxFit: BoxFit.cover,
                                )
                              : _commonClass.networkImageView(
                                  userPic.$,
                                  height: 100,
                                  width: 100,
                                  boxFit: BoxFit.cover,
                                )),
                    ),
                  ],
                ),
                _commonClass.getSizedBox(height: 20),
                _commonClass.getText(userName.$,
                    textStyle: Styles.ralewayMedium),
                _commonClass.getSizedBox(height: 5),
                _commonClass.getText(userEmail.$,
                    textStyle: Styles.ralewayRegular),
                _commonClass.getSizedBox(height: 50),
                _commonClass.buildMenus(FontAwesomeIcons.gear, "Settings"),
                _commonClass.buildMenus(FontAwesomeIcons.lock, "Privacy"),
                _commonClass.buildMenus(FontAwesomeIcons.bell, "Notifications"),
                _commonClass.buildMenus(
                    FontAwesomeIcons.locationDot, "Add Address"),
                GestureDetector(
                  onTap: () {},
                  child: _commonClass.buildMenus(
                      FontAwesomeIcons.clockRotateLeft, "Order History"),
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (c) {
                          return confirmLogout();
                        });
                  },
                  child: _commonClass.buildMenus(
                      FontAwesomeIcons.arrowRightFromBracket, "Logout"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  confirmLogout(){

    return StatefulBuilder(
        builder: (context, innerState) {
          return AlertDialog(
            title: Container(
              padding:
              const EdgeInsets.all(Dimensions.size10),
              decoration: BoxDecoration(
                color: _customColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(
                        Dimensions.size1,
                        Dimensions.size1,
                      ),
                      color: _customColors.greyColor
                          .withOpacity(0.2),
                      spreadRadius: Dimensions.size2,
                      blurRadius: Dimensions.size5)
                ],
              ),
              child: Row(
                children: [
                  _commonClass.getText("Logout?"),
                  const Spacer(),
                  const Icon(
                    FontAwesomeIcons.xmark,
                    size: Dimensions.size15,
                  ),
                ],
              ),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _commonClass.getText(
                    "Are you sure you want to logout?")
              ],
            ),
            titlePadding:
            const EdgeInsets.all(Dimensions.size0),
            actions: [
              CommonButton("No", () {
                Navigator.pop(context);
              }),
              CommonButton("Yes", () {

                if(loginType.$==StringKeys.googleType)
                  {
                    GoogleSignIn googleSignIn=GoogleSignIn();
                    googleSignIn.signOut().then((value) {
                      finalLogout();

                    }).catchError((onError){});

                  }
                else if(loginType.$==StringKeys.facebookType)
                  {
                    FacebookAuth.instance.logOut().then((value) {
                      finalLogout();

                    }).catchError((onError){});
                  }

              })
            ],
          );
        });
  }

  void finalLogout() {
    isLoggedIn.$ = false;
    userName.$ = "";
    userEmail.$ = "";
    userPic.$ = "";
    Navigator.pop(context);
    Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.signInScreenRoute,
            (route) => false);
  }
}


