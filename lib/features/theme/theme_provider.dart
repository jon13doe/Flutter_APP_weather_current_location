import 'package:flutter/widgets.dart';

import 'theme_chema.dart';

class ThemeProvider extends InheritedWidget {
  final ThemeChema themeChema;

  const ThemeProvider({
    super.key,
    required this.themeChema,
    required super.child,
  });

  static ThemeProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ThemeProvider>();

  @override
  bool updateShouldNotify(covariant ThemeProvider oldWidget) {
    return true;
  }
}
