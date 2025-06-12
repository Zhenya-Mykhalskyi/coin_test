import 'package:coinin_test/src/core/app/app_themes.dart';
import 'package:coinin_test/src/features/settings/bloc/app_settings_bloc.dart';
import 'package:coinin_test/src/core/navigation/app_routes.dart';
import 'package:coinin_test/src/core/services/preferences_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesService.init();
  runApp(const CoinInApp());
}

class CoinInApp extends StatelessWidget {
  const CoinInApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AppSettingsBloc()..add(const AppSettingsInitialized()),
      child: BlocBuilder<AppSettingsBloc, AppSettingsState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'CoinIn',
            debugShowCheckedModeBanner: false,
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: state.themeMode == AppThemeMode.dark
                ? ThemeMode.dark
                : ThemeMode.light,
            locale: Locale(state.language == AppLanguage.uk ? 'uk' : 'en'),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routerConfig: AppRoutes.createRouter(),
          );
        },
      ),
    );
  }
}
