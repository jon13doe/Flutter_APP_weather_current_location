import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_current_location/features/theme/index.dart';
import 'package:weather_app_current_location/generated/l10n.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'dynm_icon_button.dart';

class HomeScreenSideMenu extends StatefulWidget {
  const HomeScreenSideMenu({super.key});

  @override
  State<HomeScreenSideMenu> createState() => _SideMenuBarState();
}

String themeColors({required int currentTheme}) {
  switch (currentTheme) {
    case 1:
      return 'system';
    case 2:
      return 'light';
    default:
      return 'dark';
  }
}

class _SideMenuBarState extends State<HomeScreenSideMenu> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    ThemeChema theme = ThemeProvider.of(context)!.themeChema;
    int curentColorTheme = theme.curentColorTheme;
    int simpleTheme = theme.simpleTheme;
    bool animatedTheme = theme.animatedTheme;
    int iconTheme = theme.iconTheme;

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Drawer(
        backgroundColor: Colors.white.withOpacity(0.75),
        child: Padding(
          padding: const EdgeInsets.all(
            16,
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        S.of(context).menuTitle,
                        style: textTheme.titleLarge,
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon([
                              Icons.light_mode,
                              Icons.dark_mode,
                              Symbols.settings_night_sight,
                            ][curentColorTheme]),
                            iconSize: 32,
                            onPressed: () {
                              setState(() {
                                theme.switchCurentColorTheme(
                                    curentColorTheme != 2
                                        ? curentColorTheme + 1
                                        : 0);
                                curentColorTheme = theme.curentColorTheme;
                                if (curentColorTheme == 0) {
                                  AdaptiveTheme.of(context).setLight();
                                } else if (curentColorTheme == 1) {
                                  AdaptiveTheme.of(context).setDark();
                                } else if (curentColorTheme == 2) {
                                  AdaptiveTheme.of(context).setSystem();
                                }
                              });
                            },
                          ),
                          Text(
                              'Switch to ${themeColors(currentTheme: curentColorTheme)} theme colors'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: InkWell(
                              child: Container(
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [
                                      [Colors.black, Colors.black],
                                      [Colors.red, Colors.green]
                                    ][simpleTheme],
                                  ),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  theme.switchThemeType(
                                      simpleTheme == 0 ? 1 : 0);
                                });
                              },
                            ),
                          ),
                          Text(
                              'Switch to ${simpleTheme == 1 ? 'regular' : 'simple'} theme'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Switch(
                              value: iconTheme == 0,
                              onChanged: (bool newValue) {
                                setState(() {
                                  theme.switchIconTheme(1);
                                });
                              },
                            ),
                          ),
                          Text(
                              'Switch ${iconTheme == 0 ? 'off' : 'on'} weather icons'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Switch(
                              value: animatedTheme,
                              onChanged: (bool newValue) {
                                setState(() {
                                  theme.switchAnimation(newValue);
                                });
                              },
                            ),
                          ),
                          Text(
                              'Switch ${animatedTheme ? 'off' : 'on'} animation'),
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            print(theme.param());
                          },
                          icon: Icon(Icons.abc))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
