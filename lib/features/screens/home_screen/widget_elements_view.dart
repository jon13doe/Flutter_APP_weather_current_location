import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_current_location/features/bloc/weather_bloc.dart';

import '../elements/index.dart';

class WidgetElementsView extends StatelessWidget {
  const WidgetElementsView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return BlocBuilder<WeatherBloc, WeatherBlocState>(
      builder: (context, state) {
        if (state is WeatherBlocSuccess) {
          return Stack(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 1.4 * kToolbarHeight,
                  ),
                  SizedBox(
                    width: width,
                    height: 0.5 * width,
                    child: LayoutBuilder(builder:
                        (BuildContext context, BoxConstraints constraints) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top: 0,
                            left: 0.3 * constraints.maxWidth,
                            child: SizedBox(
                                height: 0.4 * constraints.maxHeight,
                                width: constraints.maxWidth,
                                child: const Cloud(
                                  color: 1,
                                )),
                          ),
                          Positioned(
                              top: 0.32 * constraints.maxHeight,
                              left: 0.725 * constraints.maxWidth,
                              child: SizedBox(
                                height: 0.35 * constraints.maxHeight,
                                width: 0.2 * constraints.maxWidth,
                                child: const Precipitation(
                                  rain: true,
                                  intensity: 4,
                                  wind: true,
                                ),
                              )),
                          Positioned(
                            top: 0.025 * constraints.maxHeight,
                            left: 0.05 * constraints.maxWidth,
                            child: SizedBox(
                                height: 0.6 * constraints.maxHeight,
                                child: const Cloud(
                                  color: 1,
                                )),
                          ),
                          Positioned(
                              top: 0.5125 * constraints.maxHeight,
                              left: 0.35 * constraints.maxWidth -
                                  0.5 * (0.4 * constraints.maxWidth),
                              child: SizedBox(
                                height: 0.45 * constraints.maxHeight,
                                width: 0.3 * constraints.maxWidth,
                                child: const Precipitation(
                                  rain: true,
                                  intensity: 4,
                                  wind: true,
                                ),
                              )),
                          Positioned(
                            top: 0.14 * constraints.maxHeight,
                            left: 0.12 * constraints.maxWidth,
                            child: SizedBox(
                                height: 0.55 * constraints.maxHeight,
                                width: constraints.maxWidth,
                                child: const Sun(
                                  gradient: false,
                                  smallRay: false,
                                )),
                          ),
                          SizedBox(
                              height: 0.65 * constraints.maxHeight,
                              child: const Cloud(
                                color: 0,
                              )),
                          Positioned(
                              top: 0.7 * constraints.maxHeight,
                              left: 0.5 * constraints.maxWidth -
                                  0.5 * (0.4 * constraints.maxWidth),
                              child: SizedBox(
                                height: 0.65 * constraints.maxHeight,
                                width: 0.4 * constraints.maxWidth,
                                child: const Precipitation(
                                  rain: false,
                                  intensity: 4,
                                  wind: true,
                                ),
                              )),
                        ],
                      );
                    }),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      '${state.weather.temperature!.celsius!.round()} °C',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      state.weather.weatherMain!.toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: Text(
                      DateFormat('EEEE dd •')
                          .add_Hm()
                          .format(state.weather.date!),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              height: 0.2 * width,
                              width: 0.2 * width,
                              child: const RiseSet(
                                rise: true,
                                sun: true,
                              )),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Sunrise',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                DateFormat()
                                    .add_Hm()
                                    .format(state.weather.sunrise!),
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
                          SizedBox(
                              height: 0.2 * width,
                              width: 0.2 * width,
                              child: const RiseSet(
                                rise: false,
                                sun: true,
                              )),
                          const SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Sunset',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                DateFormat()
                                    .add_Hm()
                                    .format(state.weather.sunset!),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                              height: 0.15 * width,
                              width: 0.15 * width,
                              child: const MinMaxTemp(maxTemp: true)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'MaxTemp',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "${state.weather.tempMax!.celsius!.round()} °C",
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
                          SizedBox(
                              height: 0.15 * width,
                              width: 0.15 * width,
                              child: const MinMaxTemp(maxTemp: false)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'MinTemp',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                "${state.weather.tempMin!.celsius!.round()} °C",
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
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
