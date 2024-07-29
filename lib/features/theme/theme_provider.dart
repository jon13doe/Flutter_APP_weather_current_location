import 'package:flutter/widgets.dart';
import 'theme_chema.dart';

class ThemeProvider extends InheritedNotifier<ValueNotifier<ThemeChema>> {
  final ThemeChema themeChema;

  ThemeProvider({
    super.key,
    required this.themeChema,
    required super.child,
  }) : super(
          notifier: ValueNotifier<ThemeChema>(themeChema),
        );

  static ThemeChema? of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<ThemeProvider>();
    return provider?.notifier?.value;
  }

  void updateThemeChema(ThemeChema newThemeChema) {
    notifier?.value = newThemeChema;
  }
}
