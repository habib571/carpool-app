/*import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  static ThemeController get to => Get.find();
  final theme = "system".obs;
  final store = GetStorage();
  late ThemeMode _themeMode;

  ThemeMode get themeMode => _themeMode;
  String get currentTheme => theme.value;

  Future<void> setThemeMode(String value) async {
    theme.value = value;
    _themeMode = getThemeModeFromString(value);
    Get.changeThemeMode(_themeMode);
    await store.write('theme', value);
    update();
  }

  ThemeMode getThemeModeFromString(String themeString) {
    ThemeMode setThemeMode = ThemeMode.system;
    if (themeString == 'light') {
      setThemeMode = ThemeMode.light;
    }
    if (themeString == 'dark') {
      setThemeMode = ThemeMode.dark;
    }
    return setThemeMode;
  }

  getThemeModeFromStore() async {
    String themeString = store.read('theme') ?? 'system';
    setThemeMode(themeString);
  }

  // checks whether darkmode is set via system or previously by user
  bool get isDarkModeOn {
    if (currentTheme == 'system') {
      // ignore: deprecated_member_use
      if (WidgetsBinding.instance.window.platformBrightness ==
          Brightness.dark) {
        return true;
      }
    }
    if (currentTheme == 'dark') {
      return true;
    }
    return false;
  }
}
*/