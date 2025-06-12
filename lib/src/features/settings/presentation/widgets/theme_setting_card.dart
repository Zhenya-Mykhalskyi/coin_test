import 'package:coinin_test/src/core/extensions/context_extension.dart';
import 'package:coinin_test/src/core/extensions/theme_extension.dart';
import 'package:coinin_test/src/core/resources/app_colors.dart';
import 'package:coinin_test/src/core/resources/app_const.dart';
import 'package:coinin_test/src/features/settings/bloc/app_settings_bloc.dart';
import 'package:coinin_test/src/core/services/preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeSettingCard extends StatelessWidget {
  const ThemeSettingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = context.l10n;
    final theme = Theme.of(context);
    final appTheme = context.appTheme;

    return BlocBuilder<AppSettingsBloc, AppSettingsState>(
      builder: (context, state) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: appTheme.coinCardBackground,
            borderRadius: BorderRadius.circular(AppConst.radius12),
          ),
          child: SwitchListTile.adaptive(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            title: Text(
              loc.darkMode,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            value: state.themeMode == AppThemeMode.dark,
            activeColor: AppColors.primaryColor,
            onChanged: (bool value) {
              context.read<AppSettingsBloc>().add(
                    AppSettingsThemeChanged(
                      value ? AppThemeMode.dark : AppThemeMode.light,
                    ),
                  );
            },
          ),
        );
      },
    );
  }
}
