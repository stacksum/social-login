import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/helper/regex_helper.dart';
import 'package:flutter_boiler_plate/utils/string_keys.dart';

class EmailTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController emailController ;
  EmailTextFormField(this.hintText,this.emailController,{Key? key}) : super(key: key);
  final RegExHelper regExHelper = RegExHelper();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      validator: (value) {
        if (regExHelper.isValidEmail(value!)) {
          return null;
        } else {
          return StringKeys.pleaseEnterValidEmail.tr();
        }
      },
      keyboardType: TextInputType.emailAddress,

      decoration:  InputDecoration(

        hintText:hintText.tr(),
      ),
    );
  }
}
