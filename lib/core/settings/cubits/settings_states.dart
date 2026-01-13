sealed class SettingsStates {}

final class SettingsInitialState extends SettingsStates {}

final class SettingsChangeModeState extends SettingsStates {}

final class SettingsChangeLanguageState extends SettingsStates {}

final class SettingsChangeNotificationsState extends SettingsStates {}

final class SettingsChangeFirstLaunchState extends SettingsStates {}

final class SettingsChangeLoginState extends SettingsStates {}

final class SettingsErrorState extends SettingsStates {
  final String error;

  SettingsErrorState(this.error);
}
