import 'package:bloc/bloc.dart';
import 'package:coinin_test/src/core/services/preferences_service.dart';
import 'package:equatable/equatable.dart';

part 'app_settings_event.dart';
part 'app_settings_state.dart';

class AppSettingsBloc extends Bloc<AppSettingsEvent, AppSettingsState> {
  AppSettingsBloc() : super(AppSettingsState.initial()) {
    on<AppSettingsInitialized>(_onInitialized);
    on<AppSettingsThemeChanged>(_onThemeChanged);
    on<AppSettingsLanguageChanged>(_onLanguageChanged);
  }

  Future<void> _onInitialized(
    AppSettingsInitialized event,
    Emitter<AppSettingsState> emit,
  ) async {
    try {
      await PreferencesService.init();
      final theme = await PreferencesService.getThemeMode();
      final language = await PreferencesService.getLanguage();

      emit(state.copyWith(
        themeMode: theme,
        language: language,
      ));
    } catch (e) {
      emit(state.copyWith(
        themeMode: AppThemeMode.light,
        language: AppLanguage.en,
      ));
    }
  }

  Future<void> _onThemeChanged(
    AppSettingsThemeChanged event,
    Emitter<AppSettingsState> emit,
  ) async {
    await PreferencesService.setThemeMode(event.themeMode);
    emit(state.copyWith(themeMode: event.themeMode));
  }

  Future<void> _onLanguageChanged(
    AppSettingsLanguageChanged event,
    Emitter<AppSettingsState> emit,
  ) async {
    await PreferencesService.setLanguage(event.language);
    emit(state.copyWith(language: event.language));
  }
}
