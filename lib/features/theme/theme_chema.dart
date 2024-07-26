import 'package:shared_preferences/shared_preferences.dart';

class ThemeChema {
  int curentColorTheme;
  bool simpleTheme;
  bool animatedTheme;
  bool iconTheme;

  ThemeChema({
    required this.curentColorTheme,
    required this.iconTheme,
    required this.simpleTheme,
    required this.animatedTheme,
  });

  switchCurentColorTheme(int newValue) {
    curentColorTheme = newValue;
    _saveToPrefs();
  }

  switchThemeType(bool newValue) {
    simpleTheme = newValue;
    _saveToPrefs();
  }

  switchAnimation(bool newValue) {
    animatedTheme = newValue;
    _saveToPrefs();
  }

  switchIconTheme(bool newValue) {
    iconTheme = newValue;
    _saveToPrefs();
  }

  param() {
    return 'curentColorTheme: $curentColorTheme, simpleTheme: $simpleTheme, animatedTheme: $animatedTheme, iconTheme: $iconTheme';
  }

  Future<void> _saveToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('curentColorTheme', curentColorTheme);
    prefs.setBool('simpleTheme', simpleTheme);
    prefs.setBool('animatedTheme', animatedTheme);
    prefs.setBool('iconTheme', iconTheme);
  }

  static Future<ThemeChema?> loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('curentColorTheme')) {
      return ThemeChema(
        curentColorTheme: prefs.getInt('curentColorTheme') ?? 0,
        simpleTheme: prefs.getBool('simpleTheme') ?? true,
        animatedTheme: prefs.getBool('animatedTheme') ?? false,
        iconTheme: prefs.getBool('iconTheme') ?? false,
      );
    }
    return null;
  }
}
