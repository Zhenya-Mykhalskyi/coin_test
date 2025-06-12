import 'package:shared_preferences/shared_preferences.dart';

enum AppThemeMode { light, dark }

enum AppLanguage { en, uk }

class PreferencesService {
  static const _themeKey = 'theme_mode';
  static const _languageKey = 'language';

  static SharedPreferences? _prefs;
  static bool _isInitialized = false;

  static Future<void> init() async {
    if (_isInitialized) return;
    _prefs = await SharedPreferences.getInstance();
    _isInitialized = true;
  }

  static Future<SharedPreferences?> _getPrefs() async {
    if (!_isInitialized || _prefs == null) {
      await init();
    }
    return _prefs;
  }

  static Future<AppThemeMode> getThemeMode() async {
    final prefs = await _getPrefs();
    final themeString = prefs?.getString(_themeKey);
    return themeString == 'dark' ? AppThemeMode.dark : AppThemeMode.light;
  }

  static Future<void> setThemeMode(AppThemeMode theme) async {
    final prefs = await _getPrefs();
    await prefs?.setString(_themeKey, theme.name);
  }

  static Future<AppLanguage> getLanguage() async {
    final prefs = await _getPrefs();
    final languageString = prefs?.getString(_languageKey);
    return languageString == 'uk' ? AppLanguage.uk : AppLanguage.en;
  }

  static Future<void> setLanguage(AppLanguage language) async {
    final prefs = await _getPrefs();
    await prefs?.setString(_languageKey, language.name);
  }
}
