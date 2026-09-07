import 'package:flutter/material.dart';

import '../constant/gen/fonts.gen.dart';
import 'theme_colors.dart';

/// {@template theme_text_styles}
/// Text style tokens for the app.
/// {@endtemplate}
@immutable
final class ThemeTextStyles extends ThemeExtension<ThemeTextStyles> {
  const ThemeTextStyles({
    required this.interW500s10,
    required this.interW400s12,
    required this.interW400s12Grey500,
    required this.interW400s14,
    required this.interW400s14Grey500,
    required this.interW400s16,
    required this.interW500s14,
    required this.interW500s14Grey500,
    required this.interW500s16,
    required this.interW600s12,
    required this.interW600s14,
    required this.interW600s14Error,
    required this.interW600s14White,
    required this.interW600s16,
    required this.interW700s16,
    required this.interW700s16White,
    required this.sfProDisplayW700s18,
    required this.sfProDisplayW700s20,
    required this.sfProDisplayW800s26,
    required this.sfProDisplayW900s30,
    required this.sfProDisplayW900s32,
  });

  static const _lightThemeTextStyleColor = Color(0xff0C111D); // default gray800
  static const _darkThemeTextStyleColor = Colors.white;

  // Inter
  final TextStyle interW500s10;
  final TextStyle interW400s12;
  final TextStyle interW400s12Grey500;
  final TextStyle interW400s14;
  final TextStyle interW400s14Grey500;
  final TextStyle interW400s16;
  final TextStyle interW500s14;
  final TextStyle interW500s14Grey500;
  final TextStyle interW500s16;
  final TextStyle interW600s12;
  final TextStyle interW600s14;
  final TextStyle interW600s14Error;
  final TextStyle interW600s14White;
  final TextStyle interW600s16;
  final TextStyle interW700s16;
  final TextStyle interW700s16White;

  // SF Pro Display
  final TextStyle sfProDisplayW700s18;
  final TextStyle sfProDisplayW700s20;
  final TextStyle sfProDisplayW800s26;
  final TextStyle sfProDisplayW900s30;
  final TextStyle sfProDisplayW900s32;

  static const _interTextStyle = TextStyle(fontFamily: FontFamily.inter, decoration: .none);
  static const _sfProDisplayTextStyle = TextStyle(fontFamily: FontFamily.sFProDisplay, decoration: .none);

  static final light = ThemeTextStyles(
    interW500s10: _interTextStyle.copyWith(fontSize: 10, fontWeight: .w500, color: _lightThemeTextStyleColor),
    interW400s12: _interTextStyle.copyWith(fontSize: 12, fontWeight: .w400, color: _lightThemeTextStyleColor),
    interW400s12Grey500: _interTextStyle.copyWith(fontSize: 12, fontWeight: .w400, color: ThemeColors.grey500Color),
    interW400s14: _interTextStyle.copyWith(fontSize: 14, fontWeight: .w400, color: _lightThemeTextStyleColor),
    interW400s14Grey500: _interTextStyle.copyWith(fontSize: 14, fontWeight: .w400, color: ThemeColors.grey500Color),
    interW400s16: _interTextStyle.copyWith(fontSize: 16, fontWeight: .w400, color: _lightThemeTextStyleColor),
    interW500s14: _interTextStyle.copyWith(fontSize: 14, fontWeight: .w500, color: _lightThemeTextStyleColor),
    interW500s14Grey500: _interTextStyle.copyWith(fontSize: 14, fontWeight: .w500, color: ThemeColors.grey500Color),
    interW500s16: _interTextStyle.copyWith(fontSize: 16, fontWeight: .w500, color: _lightThemeTextStyleColor),
    interW600s12: _interTextStyle.copyWith(fontSize: 12, fontWeight: .w600, color: _lightThemeTextStyleColor),
    interW600s14: _interTextStyle.copyWith(fontSize: 14, fontWeight: .w600, color: _lightThemeTextStyleColor),
    interW600s14Error: _interTextStyle.copyWith(fontSize: 14, fontWeight: .w600, color: ThemeColors.errorColor),
    interW600s14White: _interTextStyle.copyWith(fontSize: 14, fontWeight: .w600, color: ThemeColors.whiteColor),
    interW600s16: _interTextStyle.copyWith(fontSize: 16, fontWeight: .w600, color: _lightThemeTextStyleColor),
    interW700s16: _interTextStyle.copyWith(fontSize: 16, fontWeight: .w700, color: _lightThemeTextStyleColor),
    interW700s16White: _interTextStyle.copyWith(fontSize: 16, fontWeight: .w700, color: ThemeColors.whiteColor),
    sfProDisplayW700s18: _sfProDisplayTextStyle.copyWith(
      fontSize: 18,
      fontWeight: .w700,
      color: _lightThemeTextStyleColor,
    ),
    sfProDisplayW700s20: _sfProDisplayTextStyle.copyWith(
      fontSize: 20,
      fontWeight: .w700,
      color: _lightThemeTextStyleColor,
    ),
    sfProDisplayW800s26: _sfProDisplayTextStyle.copyWith(
      fontSize: 26,
      fontWeight: .w800,
      color: _lightThemeTextStyleColor,
    ),
    sfProDisplayW900s30: _sfProDisplayTextStyle.copyWith(
      fontSize: 30,
      fontWeight: .w900,
      color: _lightThemeTextStyleColor,
    ),
    sfProDisplayW900s32: _sfProDisplayTextStyle.copyWith(
      fontSize: 32,
      fontWeight: .w900,
      color: _lightThemeTextStyleColor,
    ),
  );

  static final dark = ThemeTextStyles(
    interW500s10: _interTextStyle.copyWith(fontSize: 10, fontWeight: .w500, color: _darkThemeTextStyleColor),
    interW400s12: _interTextStyle.copyWith(fontSize: 12, fontWeight: .w400, color: _darkThemeTextStyleColor),
    interW400s12Grey500: _interTextStyle.copyWith(fontSize: 12, fontWeight: .w400, color: ThemeColors.grey500Color),
    interW400s14: _interTextStyle.copyWith(fontSize: 14, fontWeight: .w400, color: _darkThemeTextStyleColor),
    interW400s14Grey500: _interTextStyle.copyWith(fontSize: 14, fontWeight: .w400, color: ThemeColors.grey500Color),
    interW400s16: _interTextStyle.copyWith(fontSize: 16, fontWeight: .w400, color: _darkThemeTextStyleColor),
    interW500s14: _interTextStyle.copyWith(fontSize: 14, fontWeight: .w500, color: _darkThemeTextStyleColor),
    interW500s14Grey500: _interTextStyle.copyWith(fontSize: 14, fontWeight: .w500, color: ThemeColors.grey500Color),
    interW500s16: _interTextStyle.copyWith(fontSize: 16, fontWeight: .w500, color: _darkThemeTextStyleColor),
    interW600s12: _interTextStyle.copyWith(fontSize: 12, fontWeight: .w600, color: _darkThemeTextStyleColor),
    interW600s14: _interTextStyle.copyWith(fontSize: 14, fontWeight: .w600, color: _darkThemeTextStyleColor),
    interW600s14Error: _interTextStyle.copyWith(fontSize: 14, fontWeight: .w600, color: ThemeColors.errorColor),
    interW600s14White: _interTextStyle.copyWith(fontSize: 14, fontWeight: .w600, color: ThemeColors.whiteColor),
    interW600s16: _interTextStyle.copyWith(fontSize: 16, fontWeight: .w600, color: _darkThemeTextStyleColor),
    interW700s16: _interTextStyle.copyWith(fontSize: 16, fontWeight: .w700, color: _darkThemeTextStyleColor),
    interW700s16White: _interTextStyle.copyWith(fontSize: 16, fontWeight: .w700, color: ThemeColors.whiteColor),
    sfProDisplayW700s18: _sfProDisplayTextStyle.copyWith(
      fontSize: 18,
      fontWeight: .w700,
      color: _darkThemeTextStyleColor,
    ),
    sfProDisplayW700s20: _sfProDisplayTextStyle.copyWith(
      fontSize: 20,
      fontWeight: .w700,
      color: _darkThemeTextStyleColor,
    ),
    sfProDisplayW800s26: _sfProDisplayTextStyle.copyWith(
      fontSize: 26,
      fontWeight: .w800,
      color: _darkThemeTextStyleColor,
    ),
    sfProDisplayW900s30: _sfProDisplayTextStyle.copyWith(
      fontSize: 30,
      fontWeight: .w900,
      color: _darkThemeTextStyleColor,
    ),
    sfProDisplayW900s32: _sfProDisplayTextStyle.copyWith(
      fontSize: 32,
      fontWeight: .w900,
      color: _darkThemeTextStyleColor,
    ),
  );

  @override
  ThemeTextStyles copyWith({
    TextStyle? interW500s10,
    TextStyle? interW400s12,
    TextStyle? interW400s12Grey500,
    TextStyle? interW400s14,
    TextStyle? interW400s14Grey500,
    TextStyle? interW400s16,
    TextStyle? interW500s14,
    TextStyle? interW500s14Grey500,
    TextStyle? interW500s16,
    TextStyle? interW600s12,
    TextStyle? interW600s14,
    TextStyle? interW600s14Error,
    TextStyle? interW600s14White,
    TextStyle? interW600s16,
    TextStyle? interW700s16,
    TextStyle? interW700s16White,
    TextStyle? sfProDisplayW700s18,
    TextStyle? sfProDisplayW700s20,
    TextStyle? sfProDisplayW800s26,
    TextStyle? sfProDisplayW900s30,
    TextStyle? sfProDisplayW900s32,
  }) => ThemeTextStyles(
    interW500s10: interW500s10 ?? this.interW500s10,
    interW400s12: interW400s12 ?? this.interW400s12,
    interW400s12Grey500: interW400s12Grey500 ?? this.interW400s12Grey500,
    interW400s14: interW400s14 ?? this.interW400s14,
    interW400s14Grey500: interW400s14Grey500 ?? this.interW400s14Grey500,
    interW400s16: interW400s16 ?? this.interW400s16,
    interW500s14: interW500s14 ?? this.interW500s14,
    interW500s14Grey500: interW500s14Grey500 ?? this.interW500s14Grey500,
    interW500s16: interW500s16 ?? this.interW500s16,
    interW600s12: interW600s12 ?? this.interW600s12,
    interW600s14: interW600s14 ?? this.interW600s14,
    interW600s14Error: interW600s14Error ?? this.interW600s14Error,
    interW600s14White: interW600s14White ?? this.interW600s14White,
    interW600s16: interW600s16 ?? this.interW600s16,
    interW700s16: interW700s16 ?? this.interW700s16,
    interW700s16White: interW700s16White ?? this.interW700s16White,
    sfProDisplayW700s18: sfProDisplayW700s18 ?? this.sfProDisplayW700s18,
    sfProDisplayW700s20: sfProDisplayW700s20 ?? this.sfProDisplayW700s20,
    sfProDisplayW800s26: sfProDisplayW800s26 ?? this.sfProDisplayW800s26,
    sfProDisplayW900s30: sfProDisplayW900s30 ?? this.sfProDisplayW900s30,
    sfProDisplayW900s32: sfProDisplayW900s32 ?? this.sfProDisplayW900s32,
  );

  @override
  ThemeTextStyles lerp(covariant ThemeExtension<ThemeTextStyles>? other, double t) {
    if (other is! ThemeTextStyles) {
      return this;
    }
    return ThemeTextStyles(
      interW500s10: TextStyle.lerp(interW500s10, other.interW500s10, t)!,
      interW400s12: TextStyle.lerp(interW400s12, other.interW400s12, t)!,
      interW400s12Grey500: TextStyle.lerp(interW400s12Grey500, other.interW400s12Grey500, t)!,
      interW400s14: TextStyle.lerp(interW400s14, other.interW400s14, t)!,
      interW400s14Grey500: TextStyle.lerp(interW400s14Grey500, other.interW400s14Grey500, t)!,
      interW400s16: TextStyle.lerp(interW400s16, other.interW400s16, t)!,
      interW500s14: TextStyle.lerp(interW500s14, other.interW500s14, t)!,
      interW500s14Grey500: TextStyle.lerp(interW500s14Grey500, other.interW500s14Grey500, t)!,
      interW500s16: TextStyle.lerp(interW500s16, other.interW500s16, t)!,
      interW600s12: TextStyle.lerp(interW600s12, other.interW600s12, t)!,
      interW600s14: TextStyle.lerp(interW600s14, other.interW600s14, t)!,
      interW600s14Error: TextStyle.lerp(interW600s14Error, other.interW600s14Error, t)!,
      interW600s14White: TextStyle.lerp(interW600s14White, other.interW600s14White, t)!,
      interW600s16: TextStyle.lerp(interW600s16, other.interW600s16, t)!,
      interW700s16: TextStyle.lerp(interW700s16, other.interW700s16, t)!,
      interW700s16White: TextStyle.lerp(interW700s16White, other.interW700s16White, t)!,
      sfProDisplayW700s18: TextStyle.lerp(sfProDisplayW700s18, other.sfProDisplayW700s18, t)!,
      sfProDisplayW700s20: TextStyle.lerp(sfProDisplayW700s20, other.sfProDisplayW700s20, t)!,
      sfProDisplayW800s26: TextStyle.lerp(sfProDisplayW800s26, other.sfProDisplayW800s26, t)!,
      sfProDisplayW900s30: TextStyle.lerp(sfProDisplayW900s30, other.sfProDisplayW900s30, t)!,
      sfProDisplayW900s32: TextStyle.lerp(sfProDisplayW900s32, other.sfProDisplayW900s32, t)!,
    );
  }
}
