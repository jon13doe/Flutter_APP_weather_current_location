// ignore_for_file: public_member_api_docs, sort_constructors_first
class ThemeChema {
  int curentColorTheme;
  int simpleTheme;
  bool animatedTheme;
  int iconTheme;

  ThemeChema({
    required this.curentColorTheme,
    required this.iconTheme,
    required this.simpleTheme,
    required this.animatedTheme,
  });

  switchCurentColorTheme(int newValue) {
    curentColorTheme = newValue;
  }

  switchIconTheme(int newValue) {
    iconTheme = newValue;
  }

  switchThemeType(int newValue) {
    simpleTheme = newValue;
  }

  switchAnimation(bool newValue) {
    animatedTheme = newValue;
  }

  param() {
    return 'curentColorTheme: $curentColorTheme, $iconTheme, simpleTheme: $simpleTheme, animatedTheme: $animatedTheme';
  }
}
