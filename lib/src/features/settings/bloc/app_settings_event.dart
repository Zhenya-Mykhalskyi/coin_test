part of 'app_settings_bloc.dart';

abstract class AppSettingsEvent extends Equatable {
  const AppSettingsEvent();

  @override
  List<Object?> get props => [];
}

class AppSettingsInitialized extends AppSettingsEvent {
  const AppSettingsInitialized();
}

class AppSettingsThemeChanged extends AppSettingsEvent {
  const AppSettingsThemeChanged(this.themeMode);

  final AppThemeMode themeMode;

  @override
  List<Object?> get props => [themeMode];
}

class AppSettingsLanguageChanged extends AppSettingsEvent {
  const AppSettingsLanguageChanged(this.language);

  final AppLanguage language;

  @override
  List<Object?> get props => [language];
}
