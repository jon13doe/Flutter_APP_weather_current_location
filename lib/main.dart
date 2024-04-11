import 'package:flutter/material.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';

import 'features/index.dart';

void main() {
  final GoogleMapsFlutterPlatform mapsImp = GoogleMapsFlutterPlatform.instance;
  if (mapsImp is GoogleMapsFlutterAndroid) {
    mapsImp.useAndroidViewSurface = false;
  }
  runApp(const WeatherApp());
}