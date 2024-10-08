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

class _HomeScreenState extends State<HomeScreen> {
  bool hideScreen = false;

  String getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && < 300:
        return 'thunderstorm';
      case >= 300 && < 400:
        return 'drizzle';
      case >= 500 && < 600:
        return 'rain';
      case >= 600 && < 700:
        return 'snow';
      case >= 700 && < 800:
        return 'clouds';
      case == 800:
        return 'sun';
      case > 800 && <= 804:
        return 'clouds_with_sun';
      default:
        return 'sun';
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeChema? themeProvider = ThemeProvider.of(context);
    bool iconTheme = themeProvider!.iconTheme;
    bool simpleTheme = themeProvider.simpleTheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).primaryColor,
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
                  child: Stack(
                    children: [
                      simpleTheme ? Container() : const RegularBackground(),
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
                                  ),
                                  Text(
                                    '${state.weather.areaName}',
                                    style: const TextStyle(
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
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Center(
                                  child: iconTheme
                                      ? Image.asset(
                                          'assets/${getWeatherIcon(state.weather.weatherConditionCode!)}.png',
                                          scale: 2.5,
                                        )
                                      : WeatherView(
                                          code: state
                                              .weather.weatherConditionCode,
                                          windSpeed: state.weather.windSpeed!,
                                        ),
                                ),
                              ),
                              Text(
                                '${state.weather.temperature!.celsius!.round()} °C',
                                style: const TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                state.weather.weatherMain!.toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                DateFormat('EEEE dd')
                                    .add_Hm()
                                    .format(state.weather.date!),
                                style: const TextStyle(
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
                                      iconTheme
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
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          Text(
                                            DateFormat()
                                                .add_Hm()
                                                .format(state.weather.sunrise!),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      iconTheme
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
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                          Text(
                                            DateFormat()
                                                .add_Hm()
                                                .format(state.weather.sunset!),
                                            style: const TextStyle(
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
