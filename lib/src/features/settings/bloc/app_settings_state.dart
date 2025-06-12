part of 'app_settings_bloc.dart';

class AppSettingsState extends Equatable {
  factory AppSettingsState.initial() {
    return const AppSettingsState(
      themeMode: AppThemeMode.light,
      language: AppLanguage.en,
    );
  }
  const AppSettingsState({
    required this.themeMode,
    required this.language,
  });

  final AppThemeMode themeMode;
  final AppLanguage language;

  AppSettingsState copyWith({
    AppThemeMode? themeMode,
    AppLanguage? language,
  }) {
    return AppSettingsState(
      themeMode: themeMode ?? this.themeMode,
      language: language ?? this.language,
    );
  }

  @override
  List<Object> get props => [themeMode, language];
}
