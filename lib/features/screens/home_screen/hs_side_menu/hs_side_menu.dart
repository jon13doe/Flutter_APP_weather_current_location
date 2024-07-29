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
    ThemeChema theme = ThemeProvider.of(context)!;
    int curentColorTheme = theme.curentColorTheme;
    bool simpleTheme = theme.simpleTheme;
    // bool animatedTheme = theme.animatedTheme;
    bool iconTheme = theme.iconTheme;

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
      child: Drawer(
        backgroundColor:
            Theme.of(context).drawerTheme.backgroundColor?.withOpacity(0.75),
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
                          DynamicIconButton(
                            iconsList: const [
                              Icons.light_mode,
                              Icons.dark_mode,
                              Symbols.settings_night_sight,
                            ],
                            initState: curentColorTheme,
                            iconSize: 32,
                            onStateChange: (index) {
                              setState(() {
                                theme.switchCurentColorTheme(index);
                                curentColorTheme = theme.curentColorTheme;
                                if (index == 0) {
                                  AdaptiveTheme.of(context).setLight();
                                } else if (index == 1) {
                                  AdaptiveTheme.of(context).setDark();
                                } else if (index == 2) {
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
                          DynamicIconButton(
                            iconsList: const [
                              Symbols.motion_mode,
                              Symbols.circle_rounded,
                            ],
                            initState: simpleTheme ? 1 : 0,
                            iconSize: 32,
                            onStateChange: (index) {
                              setState(() {
                                theme
                                    .switchThemeType(index == 0 ? false : true);
                              });
                            },
                          ),
                          Text(
                              'Switch to ${simpleTheme ? 'regular' : 'simple'} theme'),
                        ],
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.start,
                      //   children: [
                      //     DynamicIconButton(
                      //       iconsList: const [
                      //         Symbols.slow_motion_video,
                      //         Symbols.motion_photos_pause,
                      //       ],
                      //       initState: animatedTheme ? 1 : 0,
                      //       iconSize: 32,
                      //       onStateChange: (index) {
                      //         setState(() {
                      //           theme
                      //               .switchAnimation(index == 0 ? false : true);
                      //         });
                      //       },
                      //     ),
                      //     Text(
                      //         'Switch ${animatedTheme ? 'off' : 'on'} animation'),
                      //   ],
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          DynamicIconButton(
                            iconsList: const [
                              Symbols.animated_images,
                              Symbols.image,
                            ],
                            initState: iconTheme ? 1 : 0,
                            iconSize: 32,
                            onStateChange: (index) {
                              setState(() {
                                theme
                                    .switchIconTheme(index == 0 ? false : true);
                              });
                            },
                          ),
                          Text(
                              'Switch ${iconTheme ? 'off' : 'on'} weather icons'),
                        ],
                      ),
                      //Button to log parameters from theme provider
                      // TextButton(
                      //   child: const Text('Parameters to console'),
                      //   onPressed: () {
                      //     log(theme.param());
                      //   },
                      // ),
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
