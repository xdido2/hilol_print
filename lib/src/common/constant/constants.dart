import 'package:flutter/material.dart';

sealed class Constants {
  static const Duration connectTimeout = Duration(seconds: 15);
  static const Duration receiveTimeout = Duration(seconds: 15);
  static const Curve curve = Curves.easeInOut;
  static const Duration transitionDuration = Duration(milliseconds: 300);
}
