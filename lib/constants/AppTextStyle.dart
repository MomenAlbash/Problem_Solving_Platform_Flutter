import 'package:flutter/material.dart';
import 'color_constants.dart';

class AppTextStyles {
  static TextStyle headline1WithYellow(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
      color: yellowColor,
    );
  }

  static TextStyle bodyText1(BuildContext context,Color color) {
    return Theme.of(context).textTheme.bodyText1!.copyWith(
      color: color,
    );
  }


}