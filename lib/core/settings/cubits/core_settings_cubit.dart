import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/shared_preferences_services.dart';

class CoreSettingsCubit extends Cubit<void> {
  final SharedPreferencesService _pref;

  CoreSettingsCubit(this._pref) : super(null);

  // ===== Keys =====
  static const _themeKey = 'theme_mode';
  static const _languageKey = 'language';
  static const _notificationsKey = 'notifications';
  static const _firstLaunchKey = 'first_launch';
  static const _loginKey = 'is_login';

  // ===== Getters (SOURCE OF TRUTH) =====
  String get themeMode => _pref.getString(_themeKey, defaultValue: 'system');

  String get languageCode => _pref.getString(_languageKey, defaultValue: 'en');

  bool get notificationsEnabled =>
      _pref.getBool(_notificationsKey, defaultValue: true);

  bool get isFirstLaunch => _pref.getBool(_firstLaunchKey, defaultValue: true);

  bool get isLogin => _pref.getBool(_loginKey, defaultValue: false);

  // ===== Setters =====
  Future<void> setThemeMode(String value) async =>
      _pref.setString(_themeKey, value);

  Future<void> setLanguage(String value) async =>
      _pref.setString(_languageKey, value);

  Future<void> setNotifications(bool value) async =>
      _pref.setBool(_notificationsKey, value);

  Future<void> setFirstLaunch(bool value) async =>
      _pref.setBool(_firstLaunchKey, value);

  Future<void> setLogin(bool value) async => _pref.setBool(_loginKey, value);
}
