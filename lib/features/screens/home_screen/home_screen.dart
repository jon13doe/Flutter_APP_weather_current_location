import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_current_location/features/bloc/weather_bloc.dart';
import 'package:weather_app_current_location/features/screens/home_screen/hs_background/index.dart';
import 'package:weather_app_current_location/features/theme/index.dart';

import 'weather_view/elements/index.dart';
import 'hs_elements/index.dart';
import 'hs_side_menu/index.dart';
import 'weather_view/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

backgroundColor({required int systemDarkLightTheme}) {
  switch (systemDarkLightTheme) {
    case 1:
      return Colors.black;
    case 2:
      return Colors.white;
    default:
      return Colors.yellow;
  }
}

background({required int simpleTheme}) {
  return simpleTheme == 0
      ? Container(
          color: Colors.white,
        )
      : const RegularBackground(
          lightTheme: true,
        );
}

class _HomeScreenState extends State<HomeScreen> {
  bool hideScreen = false;

  @override
  Widget build(BuildContext context) {
    ThemeProvider? themeProvider = ThemeProvider.of(context);
    int iconTheme = themeProvider!.themeChema.iconTheme;
    int simpleTheme = themeProvider.themeChema.simpleTheme;
    int systemDarkLightTheme = themeProvider.themeChema.curentColorTheme;

    return Scaffold(
      backgroundColor:
          backgroundColor(systemDarkLightTheme: systemDarkLightTheme),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
        leading: Builder(builder: (context) {
          return hideScreen
              ? Container()
              : IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.amber,
                    size: 32,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                    setState(() {
                      hideScreen = true;
                    });
                  });
        }),
      ),
      body: Center(
        child: OrientationBuilder(builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(
                      40, 1.2 * kToolbarHeight, 40, 20),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Stack(
                      children: [
                        background(simpleTheme: simpleTheme),
                        BlocBuilder<WeatherBloc, WeatherBlocState>(
                            builder: (context, state) {
                          if (state is WeatherBlocSuccess) {
                            return Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      size: 14,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      '${state.weather.areaName}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      timeOfDayGreeting(
                                          inputDate: state.weather.date!),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                const Expanded(
                                  child: Center(
                                    child: WeatherView(
                                      code: 1,
                                    ),
                                  ),
                                ),
                                Text(
                                  '${state.weather.temperature!.celsius!.round()} °C',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  state.weather.weatherMain!.toUpperCase(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  DateFormat('EEEE dd')
                                      .add_Hm()
                                      .format(state.weather.date!),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        iconTheme == 1
                                            ? Image.asset(
                                                'assets/sunrise.png',
                                                scale: 8,
                                              )
                                            : SizedBox(
                                                height: 0.2 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                width: 0.2 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                child: const SunRiseSet(
                                                  rise: true,
                                                  sun: true,
                                                ),
                                              ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Sunrise',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            Text(
                                              DateFormat().add_Hm().format(
                                                  state.weather.sunrise!),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        iconTheme == 1
                                            ? Image.asset(
                                                'assets/sunset.png',
                                                scale: 8,
                                              )
                                            : SizedBox(
                                                height: 0.2 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                width: 0.2 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                child: const SunRiseSet(
                                                  rise: false,
                                                  sun: true,
                                                )),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Sunset',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                            Text(
                                              DateFormat().add_Hm().format(
                                                  state.weather.sunset!),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            );
                          } else {
                            return Container();
                          }
                        }),
                        if (hideScreen)
                          BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                )
              : Container();
        }),
      ),
      drawer: const HomeScreenSideMenu(),
      onDrawerChanged: (isOpened) {
        if (isOpened == true) {
          setState(() {
            hideScreen = true;
          });
        } else {
          setState(() {
            hideScreen = false;
          });
        }
      },
    );
  }
}
