import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

import 'features/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final GoogleMapsFlutterPlatform mapsImp =
      await GoogleMapsFlutterPlatform.instance;
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  if (mapsImp is GoogleMapsFlutterAndroid) {
    mapsImp.useAndroidViewSurface = false;
  }
  runApp(WeatherApp(savedThemeMode: savedThemeMode));
}
