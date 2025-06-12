import 'package:coinin_test/src/core/app/app_theme_extension.dart';
import 'package:flutter/material.dart';

extension AppThemeX on BuildContext {
  AppThemeExtension get appTheme {
    return Theme.of(this).extension<AppThemeExtension>() ??
        AppThemeExtension.light;
  }
}
