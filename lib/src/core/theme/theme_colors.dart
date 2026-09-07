import 'package:flutter/material.dart';

@immutable
final class ThemeColors extends ThemeExtension<ThemeColors> {
  const ThemeColors({
    required this.primary,
    required this.success,
    required this.error,
    required this.white,
    required this.black,
    required this.transparent,
    required this.scaffoldBackground,
    required this.grey60,
    required this.grey300,
    required this.grey500,
    required this.grey400,
    required this.grey950,
    required this.shimmer1,
    required this.shimmer2,
    required this.shimmer3,
  });

  final Color primary;
  final Color success;
  final Color error;
  final Color white;
  final Color black;
  final Color transparent;
  final Color scaffoldBackground;
  final Color grey300;
  final Color grey500;
  final Color grey400;
  final Color grey950;
  final Color grey60;
  final Color shimmer1;
  final Color shimmer2;
  final Color shimmer3;

  static const primaryColor = Color(0xFF6579FF);
  static const successColor = Color(0xFF12B76A);
  static const errorColor = Color(0xFFF44336);
  static const whiteColor = Color(0xFFFFFFFF);
  static const blackColor = Color(0xFF000000);
  static const transparentColor = Colors.transparent;
  static const lightScaffoldBackgroundColor = Color(0xFFFFFFFF);
  static const darkScaffoldBackgroundColor = Color(0xFFFFFFFF);
  static const grey300Color = Color(0xFFD0D5DD);
  static const grey60Color = Color(0xFFF2F4F7);
  static const grey500Color = Color(0xFF667085);
  static const grey400Color = Color(0xFF98A2B3);
  static const grey950Color = Color(0xFF0C111D);
  static const shimmer1Color = Color(0xFFE8E8E8);
  static const shimmer2Color = Color(0xFFF5F5F5);
  static const shimmer3Color = Color(0xFFDDDDDD);

  static const light = ThemeColors(
    primary: primaryColor,
    success: successColor,
    error: errorColor,
    white: whiteColor,
    black: blackColor,
    transparent: transparentColor,
    scaffoldBackground: lightScaffoldBackgroundColor,
    grey300: grey300Color,
    grey60: grey60Color,
    grey500: grey500Color,
    grey400: grey400Color,
    grey950: grey950Color,
    shimmer1: shimmer1Color,
    shimmer2: shimmer2Color,
    shimmer3: shimmer3Color,
  );

  static const dark = ThemeColors(
    primary: primaryColor,
    success: successColor,
    error: errorColor,
    white: whiteColor,
    black: blackColor,
    transparent: transparentColor,
    scaffoldBackground: darkScaffoldBackgroundColor,
    grey300: grey300Color,
    grey60: grey60Color,
    grey500: grey500Color,
    grey400: grey400Color,
    grey950: grey950Color,
    shimmer1: shimmer1Color,
    shimmer2: shimmer2Color,
    shimmer3: shimmer3Color,
  );

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? primary,
    Color? success,
    Color? error,
    Color? white,
    Color? black,
    Color? transparent,
    Color? scaffoldBackground,
    Color? grey300,
    Color? grey60,
    Color? grey500,
    Color? grey400,
    Color? grey950,
    Color? shimmer1,
    Color? shimmer2,
    Color? shimmer3,
  }) => ThemeColors(
    primary: primary ?? this.primary,
    success: success ?? this.success,
    error: error ?? this.error,
    white: white ?? this.white,
    black: black ?? this.black,
    transparent: transparent ?? this.transparent,
    scaffoldBackground: scaffoldBackground ?? this.scaffoldBackground,
    grey300: grey300 ?? this.grey300,
    grey60: grey60 ?? this.grey60,
    grey500: grey500 ?? this.grey500,
    grey400: grey400 ?? this.grey400,
    grey950: grey950 ?? this.grey950,
    shimmer1: shimmer1 ?? this.shimmer1,
    shimmer2: shimmer2 ?? this.shimmer2,
    shimmer3: shimmer3 ?? this.shimmer3,
  );

  @override
  ThemeExtension<ThemeColors> lerp(ThemeExtension<ThemeColors>? other, double t) => other is! ThemeColors
      ? this
      : ThemeColors(
          primary: Color.lerp(primary, other.primary, t)!,
          success: Color.lerp(success, other.success, t)!,
          error: Color.lerp(error, other.error, t)!,
          white: Color.lerp(white, other.white, t)!,
          black: Color.lerp(black, other.black, t)!,
          transparent: Color.lerp(transparent, other.transparent, t)!,
          scaffoldBackground: Color.lerp(scaffoldBackground, other.scaffoldBackground, t)!,
          grey300: Color.lerp(grey300, other.grey300, t)!,
          grey60: Color.lerp(grey60, other.grey60, t)!,
          grey500: Color.lerp(grey500, other.grey500, t)!,
          grey400: Color.lerp(grey400, other.grey400, t)!,
          grey950: Color.lerp(grey950, other.grey950, t)!,
          shimmer1: Color.lerp(shimmer1, other.shimmer1, t)!,
          shimmer2: Color.lerp(shimmer2, other.shimmer2, t)!,
          shimmer3: Color.lerp(shimmer3, other.shimmer3, t)!,
        );
}
