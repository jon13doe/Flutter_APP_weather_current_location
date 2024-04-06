import 'package:flutter/material.dart';

import '../icons_chema.dart';

class HomeScreenSideMenu extends StatefulWidget {
  const HomeScreenSideMenu({super.key});

  @override
  State<HomeScreenSideMenu> createState() => _SideMenuBarState();
}

class _SideMenuBarState extends State<HomeScreenSideMenu> {

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    IconsChemaProvider? iconsChemaProvider = IconsChemaProvider.of(context);
    bool? elementsView = iconsChemaProvider?.iconsChema.elementsView;

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(48),
        bottomRight: Radius.circular(48),
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
                        'Weather App',
                        style: textTheme.titleLarge,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Switch(
                              value: elementsView!,
                              onChanged: (bool newValue) {
                                setState(() {
                                  iconsChemaProvider?.iconsChema.changeElementsView(newValue);
                                });
                              },
                            ),
                          ),
                          const Text('Change icons shema'),
                        ],
                      ),
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
