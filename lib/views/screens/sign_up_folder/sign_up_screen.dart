import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/utils/common_class.dart';
import 'package:flutter_boiler_plate/utils/custom_colors.dart';
import 'package:flutter_boiler_plate/utils/dimensions.dart';
import 'package:flutter_boiler_plate/utils/routes.dart';
import 'package:flutter_boiler_plate/utils/string_keys.dart';
import 'package:flutter_boiler_plate/utils/styles.dart';
import 'package:flutter_boiler_plate/widgets/common_button.dart';
import 'package:flutter_boiler_plate/widgets/email_text_form_field.dart';
import 'package:flutter_boiler_plate/widgets/my_number_form_field.dart';
import 'package:flutter_boiler_plate/widgets/my_text_form_field.dart';
import 'package:flutter_boiler_plate/widgets/password_text_form_field.dart';
import 'package:flutter_boiler_plate/widgets/splash_logo_with_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final CustomColors _customColors = CustomColors();
  final CommonClass _commonClass = CommonClass();
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final TextEditingController _cPasswordEditingController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: _customColors.whiteColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(Dimensions.size10),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _commonClass.getSizedBox(
                        height: Dimensions.size20),
                    SplashLogoWithName(),
                    _commonClass.getSizedBox(
                        height:    Dimensions.size20),
                    _commonClass.getText(StringKeys.signUp.tr(),
                        textStyle: Styles.ralewayRegular.copyWith(
                            fontSize:Dimensions.size20,
                          decoration: TextDecoration.underline

                        )),
                    _commonClass.getSizedBox(
                        height:   Dimensions.size20),
                    MyTextFormField(StringKeys.enterName),
                    _commonClass.getSizedBox(
                        height: Dimensions.size20),
                    MyNumberFormField(
                      StringKeys.enterNumber,
                      maxLength: 10,
                    ),
                    _commonClass.getSizedBox(
                        height: Dimensions.size20),
                    EmailTextFormField(
                        StringKeys.enterEmail, _emailEditingController),
                    _commonClass.getSizedBox(
                        height:  Dimensions.size20),
                    PasswordTextFormField(
                        StringKeys.enterPassword, _passwordEditingController),
                    PasswordTextFormField(
                      StringKeys.enterConfirmPassword,
                      _cPasswordEditingController,
                      previousPassword:
                          _passwordEditingController.text.toString(),
                    ),
                    _commonClass.getSizedBox(
                        height:  Dimensions.size20),
                    CommonButton(StringKeys.submit.tr(), () {
                      _formKey.currentState!.validate();
                    }),
                    _commonClass.getSizedBox(
                        height:  Dimensions.size20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _commonClass.getText(StringKeys.alreadyHaveAccount.tr(),),
                        _commonClass.getSizedBox(
                            height:    Dimensions.size0,width: Dimensions.size5),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(context,
                                Routes.signInScreenRoute, (route) => false);
                          },
                          child: _commonClass.getText(
                            " ${StringKeys.signIn.tr()}",
                            textStyle: Styles.ralewayMedium
                                .copyWith(decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
