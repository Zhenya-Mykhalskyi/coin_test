import 'package:coinin_test/gen/fonts.gen.dart';
import 'package:coinin_test/src/core/app/app_theme_extension.dart';
import 'package:coinin_test/src/core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

sealed class AppThemes {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: false,
      extensions: const [AppThemeExtension.light],
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        foregroundColor: AppColors.textColor,
        backgroundColor: AppColors.transparent,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: FontFamily.poppins,
          color: AppColors.textColor,
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.whiteColor,
          foregroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConst.radius12),
          ),
          elevation: 0,
          textStyle: const TextStyle(
            fontSize: 16,
            fontFamily: FontFamily.poppins,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.whiteColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(color: AppColors.primaryColor),
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontFamily: FontFamily.poppins,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryColor,
        ),
        unselectedIconTheme: IconThemeData(
          color: AppColors.bottonNavUnselectIcon,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          fontFamily: FontFamily.poppins,
          fontWeight: FontWeight.w500,
          color: AppColors.bottonNavUnselectIcon,
        ),
      ),
      textTheme: const TextTheme(
        bodySmall: TextStyle(
          fontSize: 12,
          fontFamily: FontFamily.poppins,
          fontWeight: FontWeight.w400,
          color: AppColors.textColor,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          fontFamily: FontFamily.poppins,
          fontWeight: FontWeight.w400,
          color: AppColors.textColor,
        ),
        labelSmall: TextStyle(
          fontSize: 12,
          fontFamily: FontFamily.poppins,
          color: AppColors.textColor,
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          fontSize: 16,
          fontFamily: FontFamily.poppins,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: false,
      extensions: const [AppThemeExtension.dark],
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.transparent,
        titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: FontFamily.poppins,
            color: AppColors.whiteColor),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.bottonNavBarDark,
          foregroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConst.radius12),
          ),
          elevation: 0,
          textStyle: const TextStyle(
            fontSize: 16,
            fontFamily: FontFamily.poppins,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.bottonNavBarDark,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(color: AppColors.primaryColor),
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontFamily: FontFamily.poppins,
          fontWeight: FontWeight.w500,
          color: AppColors.primaryColor,
        ),
        unselectedIconTheme: IconThemeData(
          color: AppColors.bottonNavUnselectIconDark,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          fontFamily: FontFamily.poppins,
          fontWeight: FontWeight.w500,
          color: AppColors.bottonNavUnselectIconDark,
        ),
      ),
      textTheme: const TextTheme(
        bodySmall: TextStyle(
          fontSize: 12,
          fontFamily: FontFamily.poppins,
          fontWeight: FontWeight.w400,
          color: AppColors.whiteColor,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          fontFamily: FontFamily.poppins,
          fontWeight: FontWeight.w400,
          color: AppColors.whiteColor,
        ),
        labelSmall: TextStyle(
          fontSize: 12,
          fontFamily: FontFamily.poppins,
          fontWeight: FontWeight.w500,
          color: AppColors.whiteColor,
        ),
        labelMedium: TextStyle(
          fontSize: 16,
          fontFamily: FontFamily.poppins,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
