import 'settings_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/shared_preferences_services.dart';

class SettingsCubit extends Cubit<SettingsStates> {
  final SharedPreferencesService _pref;

  SettingsCubit(this._pref) : super(SettingsInitialState());

  // ===== Data =====
  ThemeMode theme = ThemeMode.system;
  String language = 'en';
  bool notifications = true;
  bool firstLaunch = true;
  bool isLogin = false;

  // ===== Keys =====
  static const _themeKey = 'theme_mode';
  static const _languageKey = 'language';
  static const _notificationsKey = 'notifications';
  static const _firstLaunchKey = 'first_launch';
  static const _loginKey = 'is_login';

  // ===== Constants =====

  static const Map<String, ThemeMode> themes = {
    'Light': ThemeMode.light,
    'Dark': ThemeMode.dark,
    'System': ThemeMode.system,
  };
  static const Map<String, String> languages = {
    'English': 'en',
    'Arabic': 'ar',
  };

  // ===== Getters (SOURCE OF TRUTH) =====

  void loadSettings() {
    try {
      theme =
          themes[_pref.getString(_themeKey, defaultValue: 'System')] ??
          ThemeMode.system;
      language =
          languages[_pref.getString(_languageKey, defaultValue: 'English')] ??
          'en';
      notifications = _pref.getBool(_notificationsKey, defaultValue: true);
      firstLaunch = _pref.getBool(_firstLaunchKey, defaultValue: true);
      isLogin = _pref.getBool(_loginKey, defaultValue: false);
      emit(SettingsInitialState());
    } catch (e) {
      emit(SettingsErrorState(e.toString()));
    }
  }

  // ===== Setters =====

  Future<void> setThemeMode(String value) async {
    try {
      await _pref.setString(_themeKey, value);
      theme = themes[value] ?? ThemeMode.system;
      emit(SettingsChangeModeState());
    } catch (e) {
      emit(SettingsErrorState(e.toString()));
    }
  }

  Future<void> setLanguage(String value) async {
    try {
      await _pref.setString(_languageKey, value);
      language = languages.entries
          .firstWhere(
            (element) => element.value == value,
            orElse: () => const MapEntry('English', 'en'),
          )
          .value;
      emit(SettingsChangeLanguageState());
    } catch (e) {
      emit(SettingsErrorState(e.toString()));
    }
  }

  Future<void> setNotifications(bool value) async {
    try {
      await _pref.setBool(_notificationsKey, value);
      notifications = value;
      emit(SettingsChangeNotificationsState());
    } catch (e) {
      emit(SettingsErrorState(e.toString()));
    }
  }

  Future<void> setFirstLaunch(bool value) async {
    try {
      await _pref.setBool(_firstLaunchKey, value);
      firstLaunch = value;
      emit(SettingsChangeFirstLaunchState());
    } catch (e) {
      emit(SettingsErrorState(e.toString()));
    }
  }

  Future<void> setLogin(bool value) async {
    try {
      await _pref.setBool(_loginKey, value);
      isLogin = value;
      emit(SettingsChangeLoginState());
    } catch (e) {
      emit(SettingsErrorState(e.toString()));
    }
  }
}
