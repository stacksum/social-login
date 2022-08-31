import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boiler_plate/helper/regex_helper.dart';
import 'package:flutter_boiler_plate/utils/string_keys.dart';

class MyNumberFormField extends StatelessWidget {
  final String hintText;
  final int? maxLength;
  final TextEditingController? textController;

  MyNumberFormField(this.hintText,
      {Key? key, this.maxLength, this.textController})
      : super(key: key);
  final RegExHelper regExHelper = RegExHelper();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      validator: (value) {
        if (value!.isNotEmpty) {
          return null;
        } else {
          return StringKeys.pleaseEnterNumber.tr();
        }
      },
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      maxLength: maxLength,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hintText.tr(),
      ),
    );
  }
}
