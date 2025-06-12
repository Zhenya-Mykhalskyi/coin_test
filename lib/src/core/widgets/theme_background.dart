import 'package:coinin_test/src/features/settings/bloc/app_settings_bloc.dart';
import 'package:coinin_test/src/core/resources/app_colors.dart';
import 'package:coinin_test/src/core/services/preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBackground extends StatelessWidget {
  const ThemeBackground({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingsBloc, AppSettingsState>(
      builder: (context, state) {
        if (state.themeMode == AppThemeMode.dark) {
          return ColoredBox(
            color: AppColors.canvasBackgroundDark,
            child: child,
          );
        } else {
          return Stack(
            children: [
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.gradientBackground,
                        Color.lerp(AppColors.gradientBackground,
                            AppColors.whiteColor, 0.8)!,
                      ],
                    ),
                  ),
                ),
              ),
              child,
            ],
          );
        }
      },
    );
  }
}
