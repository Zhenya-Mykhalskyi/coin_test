import 'package:coinin_test/src/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

@immutable
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  const AppThemeExtension({
    required this.premiumCardGradient1,
    required this.premiumCardGradient2,
    required this.coinCardBackground,
    required this.bottomNavUnselectedIcon,
    required this.bottomNavBarBackground,
  });

  final Color premiumCardGradient1;
  final Color premiumCardGradient2;
  final Color coinCardBackground;
  final Color bottomNavUnselectedIcon;
  final Color bottomNavBarBackground;

  @override
  AppThemeExtension copyWith({
    Color? premiumCardGradient1,
    Color? premiumCardGradient2,
    Color? coinCardBackground,
    Color? bottomNavUnselectedIcon,
    Color? bottomNavBarBackground,
  }) {
    return AppThemeExtension(
      premiumCardGradient1: premiumCardGradient1 ?? this.premiumCardGradient1,
      premiumCardGradient2: premiumCardGradient2 ?? this.premiumCardGradient2,
      coinCardBackground: coinCardBackground ?? this.coinCardBackground,
      bottomNavUnselectedIcon:
          bottomNavUnselectedIcon ?? this.bottomNavUnselectedIcon,
      bottomNavBarBackground:
          bottomNavBarBackground ?? this.bottomNavBarBackground,
    );
  }

  @override
  AppThemeExtension lerp(ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) {
      return this;
    }
    return AppThemeExtension(
      premiumCardGradient1:
          Color.lerp(premiumCardGradient1, other.premiumCardGradient1, t)!,
      premiumCardGradient2:
          Color.lerp(premiumCardGradient2, other.premiumCardGradient2, t)!,
      coinCardBackground:
          Color.lerp(coinCardBackground, other.coinCardBackground, t)!,
      bottomNavUnselectedIcon: Color.lerp(
          bottomNavUnselectedIcon, other.bottomNavUnselectedIcon, t)!,
      bottomNavBarBackground:
          Color.lerp(bottomNavBarBackground, other.bottomNavBarBackground, t)!,
    );
  }

  static const light = AppThemeExtension(
    premiumCardGradient1: AppColors.premiumCardGradient1,
    premiumCardGradient2: AppColors.premiumCardGradient2,
    coinCardBackground: AppColors.cointCardBackground,
    bottomNavUnselectedIcon: AppColors.bottonNavUnselectIcon,
    bottomNavBarBackground: AppColors.whiteColor,
  );

  static const dark = AppThemeExtension(
    premiumCardGradient1: AppColors.premiumCardGradient1Dark,
    premiumCardGradient2: AppColors.premiumCardGradient2Dark,
    coinCardBackground: AppColors.cointCardBackgroundDark,
    bottomNavUnselectedIcon: AppColors.bottonNavUnselectIconDark,
    bottomNavBarBackground: AppColors.bottonNavBarDark,
  );
}
