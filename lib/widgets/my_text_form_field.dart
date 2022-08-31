import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/helper/regex_helper.dart';
import 'package:flutter_boiler_plate/utils/string_keys.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController? textController ;
  MyTextFormField(this.hintText,{Key? key,this.textController}) : super(key: key);
  final RegExHelper regExHelper = RegExHelper();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      validator: (value) {
        if (value!.isNotEmpty) {
          return null;
        } else {
          return StringKeys.pleaseEnterName.tr();
        }
      },
      keyboardType: TextInputType.text,

      decoration:  InputDecoration(

        hintText:hintText.tr(),
      ),
    );
  }
}
