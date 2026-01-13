import 'package:flutter/material.dart';

class SettingsModel {
  final ThemeMode themeMode;
  final String langCode;
  final bool notificationsEnabled;
  final bool isFirstLaunch;
  final bool isLoggedIn;
  SettingsModel({
    required this.themeMode,
    required this.langCode,
    required this.notificationsEnabled,
    required this.isFirstLaunch,
    required this.isLoggedIn,
  });

  SettingsModel copyWith({
    ThemeMode? themeMode,
    String? langCode,
    bool? notificationsEnabled,
    bool? isFirstLaunch,
    bool? isLoggedIn,
  }) {
    return SettingsModel(
      themeMode: themeMode ?? this.themeMode,
      langCode: langCode ?? this.langCode,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      isFirstLaunch: isFirstLaunch ?? this.isFirstLaunch,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }
}
