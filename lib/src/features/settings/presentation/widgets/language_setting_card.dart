import 'package:coinin_test/src/core/extensions/context_extension.dart';
import 'package:coinin_test/src/core/extensions/theme_extension.dart';
import 'package:coinin_test/src/core/resources/app_const.dart';
import 'package:coinin_test/src/features/settings/bloc/app_settings_bloc.dart';
import 'package:coinin_test/src/core/services/preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageSettingCard extends StatelessWidget {
  const LanguageSettingCard({super.key});

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
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            title: Text(
              loc.language,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: DropdownButtonHideUnderline(
              child: DropdownButton<AppLanguage>(
                value: state.language,
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: appTheme.bottomNavUnselectedIcon,
                ),
                style: theme.textTheme.bodyMedium,
                dropdownColor: appTheme.coinCardBackground,
                onChanged: (AppLanguage? newLanguage) {
                  if (newLanguage != null) {
                    context.read<AppSettingsBloc>().add(
                          AppSettingsLanguageChanged(newLanguage),
                        );
                  }
                },
                items: AppLanguage.values.map(
                  (AppLanguage language) {
                    return DropdownMenuItem<AppLanguage>(
                      value: language,
                      child: Text(
                        language == AppLanguage.en ? 'English' : 'Українська',
                        style: theme.textTheme.bodyMedium,
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
