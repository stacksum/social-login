import 'package:flutter/material.dart';
import 'package:flutter_boiler_plate/utils/common_class.dart';
import 'package:flutter_boiler_plate/utils/custom_colors.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final CommonClass _commonClass = CommonClass();
  final CustomColors _customColors = CustomColors();

  CommonButton(this.text, this.onPressed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith(
                (states) => _customColors.mainBrandColor)),
        onPressed: () {
          onPressed();
        },
        child: _commonClass.getText(
          text,
        ));
  }
}
