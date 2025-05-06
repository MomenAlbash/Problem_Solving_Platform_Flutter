
 import 'package:flutter/material.dart';

import 'color_constants.dart';

Text mediumText({required String text,required Color color}) =>Text(
  text,
  style: TextStyle(
    fontSize: 25,
    color:color,
  ),
);
Text smallText({TextDecoration? decoration,required String text,required Color color}) => Text(
  text,
  style: TextStyle(
    fontSize: 16,
    decoration: decoration,
    color: color,
  ),
);