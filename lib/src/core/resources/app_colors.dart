import 'package:flutter/material.dart';

sealed class AppColors {
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color primaryColor = Color(0xFFEDA92D);
  static const Color transparent = Colors.transparent;

  //light theme colors
  static const Color textColor = Color(0xFF242424);
  static const Color gradientBackground = Color(0xFFFFF4DF);
  static const Color premiumCardGradient1 = Color(0xFFFFE5B7);
  static const Color premiumCardGradient2 = Color(0xFFFFD382);
  static const Color cointCardBackground = Color(0xFFF2E9DA);
  static const Color bottonNavUnselectIcon = Color(0xFF91A0B6);

  //dark theme colors
  static const Color canvasBackgroundDark = Color(0xFF1F1F27);
  static const Color premiumCardGradient1Dark = Color(0xFF5A3A14);
  static const Color premiumCardGradient2Dark = Color(0xFFA86C1D);
  static const Color cointCardBackgroundDark = Color(0xFF2F251F);
  static const Color bottonNavUnselectIconDark = Color(0xFF9B9B9B);
  static const Color bottonNavBarDark = Color(0xFF2C2C34);
}
