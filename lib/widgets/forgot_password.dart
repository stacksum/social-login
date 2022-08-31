import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/utils/common_class.dart';
import 'package:flutter_boiler_plate/utils/custom_colors.dart';
import 'package:flutter_boiler_plate/utils/dimensions.dart';
import 'package:flutter_boiler_plate/utils/string_keys.dart';

import 'common_button.dart';
import 'email_text_form_field.dart';

class ForgotPassword extends StatefulWidget {
  final Function onTap;

  const ForgotPassword(this.onTap, {Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final CustomColors _customColors = CustomColors();

  final CommonClass _commonClass = CommonClass();

  TextEditingController emailEditingController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.all(20),
        color: _customColors.whiteColor,
        child: Scaffold(
          backgroundColor: _customColors.whiteColor,
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                EmailTextFormField(
                    StringKeys.enterEmail, emailEditingController),
                _commonClass.getSizedBox(height:Dimensions.size100),
                CommonButton(StringKeys.submit.tr(), () {
                  formKey.currentState!.validate();

                  widget.onTap();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
