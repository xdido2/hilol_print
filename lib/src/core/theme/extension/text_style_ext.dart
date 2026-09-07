import '../theme_colors.dart';
import 'package:flutter/material.dart';

extension TextStyleExt on TextStyle {
  TextStyle get withWhiteColor => copyWith(color: ThemeColors.whiteColor);
  TextStyle get withBlackColor => copyWith(color: ThemeColors.blackColor);
  TextStyle get withTransparentColor => copyWith(color: ThemeColors.transparentColor);
  TextStyle get withPrimaryColor => copyWith(color: ThemeColors.primaryColor);
  TextStyle get withErrorColor => copyWith(color: ThemeColors.errorColor);

  // Size and weight example:
  // TextStyle get withW500S16 => copyWith(fontSize: 16, fontWeight: .w500);
}
