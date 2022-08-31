import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/helper/regex_helper.dart';
import 'package:flutter_boiler_plate/utils/common_class.dart';
import 'package:flutter_boiler_plate/utils/common_paths.dart';
import 'package:flutter_boiler_plate/utils/custom_colors.dart';
import 'package:flutter_boiler_plate/utils/dimensions.dart';
import 'package:flutter_boiler_plate/utils/routes.dart';
import 'package:flutter_boiler_plate/utils/string_keys.dart';
import 'package:flutter_boiler_plate/utils/styles.dart';
import 'package:flutter_boiler_plate/widgets/common_button.dart';
import 'package:flutter_boiler_plate/widgets/email_text_form_field.dart';
import 'package:flutter_boiler_plate/widgets/forgot_password.dart';
import 'package:flutter_boiler_plate/widgets/password_text_form_field.dart';
import 'package:flutter_boiler_plate/widgets/splash_logo_with_text.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_boiler_plate/utils/my_shared_preference.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final CustomColors _customColors = CustomColors();
  final CommonClass _commonClass = CommonClass();
  final CommonPaths _commonPaths = CommonPaths();
  final RegExHelper regExHelper = RegExHelper();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  GoogleSignInAccount? googleSignInAccount;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  void initState() {
    emailEditingController.text = "test@gmail.com";
    passwordEditingController.text = "Test@123";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: _customColors.whiteColor,
          body: Padding(
            padding: const EdgeInsets.all(Dimensions.size10),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SplashLogoWithName(),
                    _commonClass.getSizedBox(height: Dimensions.size20),
                    _commonClass.getText(StringKeys.signIn.tr(),
                        textStyle: Styles.ralewayRegular.copyWith(
                            fontSize: Dimensions.size20,
                            decoration: TextDecoration.underline)),
                    _commonClass.getSizedBox(height: Dimensions.size20),
                    EmailTextFormField(
                        StringKeys.enterEmail, emailEditingController),
                    _commonClass.getSizedBox(height: Dimensions.size20),
                    PasswordTextFormField(
                        StringKeys.enterPassword, passwordEditingController),
                    _commonClass.getSizedBox(height: Dimensions.size20),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (c) {
                              return ForgotPassword(() {});
                            });
                      },
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: _commonClass.getText(
                          " ${StringKeys.forgotPassword.tr()}",
                          textStyle: Styles.ralewayMedium
                              .copyWith(decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    _commonClass.getSizedBox(height: Dimensions.size52),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            FacebookAuth.instance.login(permissions: [
                              StringKeys.publicProfile,
                              StringKeys.emailKey
                            ]).then((value) {
                              if (value.status != LoginStatus.cancelled) {
                                FacebookAuth.instance
                                    .getUserData()
                                    .then((userdata) {
                                  if (userdata.isNotEmpty) {
                                    isLoggedIn.$ = true;
                                    loginType.$ = StringKeys.facebookType;
                                    userName.$ = userdata.values.elementAt(
                                        0); // In values array we name at first position.
                                    userEmail.$ = userdata.values.elementAt(
                                        1); //In values array we have email at second position.

                                    userPic.$ = userdata.values
                                            .elementAt(2)['data'][
                                        'url']; //In values array we have object value pair for profile pic we can do like this.
                                    Navigator.pushNamedAndRemoveUntil(
                                        context,
                                        Routes.profileScreenRoute,
                                        (route) => false);
                                  }
                                });
                              }
                            });
                          },
                          child: _commonClass.assetsImageView(
                              _commonPaths.facebookIcon,
                              height: 50,
                              width: 50),
                        ),
                        _commonClass.getSizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            _googleSignIn.signIn().then((userData) {
                              if (userData != null) {
                                isLoggedIn.$ = true;
                                loginType.$ = StringKeys.googleType;

                                userName.$ = userData.displayName.toString();
                                userEmail.$ = userData.email.toString();
                                userPic.$ = userData.photoUrl.toString();
                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    Routes.profileScreenRoute,
                                    (route) => false);
                              }
                            }).catchError((onError) {


                            });
                          },
                          child: _commonClass.assetsImageView(
                              _commonPaths.googleIcon,
                              height: 40,
                              width: 40),
                        ),
                      ],
                    ),
                    _commonClass.getSizedBox(height: Dimensions.size20),
                    CommonButton(StringKeys.submit.tr(), () {
                      if (formKey.currentState!.validate()) {}
                    }),
                    _commonClass.getSizedBox(height: Dimensions.size20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _commonClass.getText(
                          StringKeys.doNotHaveAccount.tr(),
                        ),
                        _commonClass.getSizedBox(
                            height: Dimensions.size0, width: Dimensions.size5),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(context,
                                Routes.signUpScreenRoute, (route) => false);
                          },
                          child: _commonClass.getText(
                            " ${StringKeys.createNew.tr()}",
                            textStyle: Styles.ralewayMedium
                                .copyWith(decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
