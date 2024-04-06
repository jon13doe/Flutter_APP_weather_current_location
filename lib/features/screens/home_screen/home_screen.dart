import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_current_location/features/bloc/weather_bloc.dart';
import 'package:weather_app_current_location/features/screens/home_screen/png_view.dart';
import 'package:weather_app_current_location/features/screens/home_screen/widget_elements_view.dart';

import 'hs_elements/index.dart';
import 'hs_side_menu/index.dart';
import 'icons_chema.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

homeScreenView(elementsView) {
  switch (elementsView) {
    case false:
      return const PngView();
    default:
      return const WidgetElementsView();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  bool hideScreen = false;

  @override
  Widget build(BuildContext context) {
    IconsChemaProvider? iconsChemaProvider = IconsChemaProvider.of(context);
    bool? elementsView = iconsChemaProvider?.iconsChema.elementsView;

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // systemOverlayStyle: const SystemUiOverlayStyle(
        //   statusBarBrightness: Brightness.dark,
        // ),
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
                        Align(
                          alignment: const AlignmentDirectional(2.5, -0.125),
                          child: Container(
                            height: 250,
                            width: 250,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.pinkAccent,
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-2.5, -0.125),
                          child: Container(
                            height: 250,
                            width: 250,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.pinkAccent,
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0, -1),
                          child: Container(
                            height: 300,
                            width: 300,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.purpleAccent,
                            ),
                          ),
                        ),
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                        BlocBuilder<WeatherBloc, WeatherBlocState>(
                            builder: (context, state) {
                          if (state is WeatherBlocSuccess) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
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
                                const SizedBox(
                                  height: 3,
                                ),
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
                            );
                          } else {
                            return Container();
                          }
                        }),
                        homeScreenView(elementsView),
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
