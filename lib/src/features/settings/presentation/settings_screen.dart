import 'package:coinin_test/src/core/extensions/context_extension.dart';
import 'package:coinin_test/src/core/extensions/theme_extension.dart';
import 'package:coinin_test/src/features/settings/presentation/widgets/language_setting_card.dart';
import 'package:coinin_test/src/features/settings/presentation/widgets/theme_setting_card.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = context.l10n;
    final appTheme = context.appTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.settings),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LanguageSettingCard(),
            const SizedBox(height: 16),
            const ThemeSettingCard(),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: appTheme.coinCardBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CoinIn App',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${loc.version} 1.0.0',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: appTheme.bottomNavUnselectedIcon,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
