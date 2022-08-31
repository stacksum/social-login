import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/helper/regex_helper.dart';
import 'package:flutter_boiler_plate/utils/custom_colors.dart';
import 'package:flutter_boiler_plate/utils/string_keys.dart';

class PasswordTextFormField extends StatefulWidget {
  final String hintText;
  final String? previousPassword;
  final TextEditingController passwordController;

  const PasswordTextFormField(this.hintText, this.passwordController,
      {Key? key, this.previousPassword})
      : super(key: key);

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  final CustomColors _customColors = CustomColors();

  final RegExHelper regExHelper = RegExHelper();

  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordController,
      validator: (value) {
        return value!.isEmpty ||
                value.length < 8 ||
                !regExHelper.isValidPassword(widget.passwordController.text)
            ? StringKeys.pleaseEnterValidPassword.tr()
            : widget.previousPassword == null
                ? null
                : widget.previousPassword != widget.passwordController.text
                    ? StringKeys.confirmPasswordNotMatch.tr()
                    : null;
      },
      obscureText: passwordVisible ? false : true,
      decoration: InputDecoration(
        hintText: widget.hintText.tr(),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              passwordVisible = passwordVisible ? false : true;
            });
          },
          child: passwordVisible
              ? Icon(
                  Icons.visibility,
                  color: _customColors.greyColor,
                )
              : Icon(
                  Icons.visibility_off,
                  color: _customColors.greyColor,
                ),
        ),
      ),
    );
  }
}
