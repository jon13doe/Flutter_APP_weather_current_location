import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:geolocator/geolocator.dart';

import 'package:weather_app_current_location/features/bloc/weather_bloc.dart';
import 'package:weather_app_current_location/generated/l10n.dart';

import 'screens/index.dart';
import 'theme/index.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ThemeChema?>(
        future: ThemeChema.loadFromPrefs(),
        builder: (context, snapshot) {
          ThemeChema themeChema = snapshot.data ??
              ThemeChema(
                curentColorTheme: 0,
                iconTheme: false,
                simpleTheme: true,
                animatedTheme: false,
              );

          return ThemeProvider(
            themeChema: themeChema,
            child: AdaptiveTheme(
                light: customLightTheme,
                dark: customDarkTheme,
                initial: AdaptiveThemeMode.light,
                builder: (light, dark) {
                  return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      localizationsDelegates: const [
                        S.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      supportedLocales: S.delegate.supportedLocales,
                      home: FutureBuilder(
                          future: _determinePosition(),
                          builder: (context, snap) {
                            if (snap.hasData) {
                              return BlocProvider<WeatherBloc>(
                                create: (context) => WeatherBloc()
                                  ..add(FetchWeather(snap.data as Position)),
                                child: const SafeArea(
                                  child: HomeScreen(),
                                ),
                              );
                            } else {
                              return const Scaffold(
                                body: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }
                          }));
                }),
          );
        });
  }
}

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}
