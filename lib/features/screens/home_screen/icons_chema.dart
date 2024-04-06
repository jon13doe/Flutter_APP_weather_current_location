import 'package:flutter/widgets.dart';

class IconsChemaProvider extends InheritedWidget {
  final IconsChema iconsChema;

  const IconsChemaProvider({
    super.key,
    required this.iconsChema,
    required super.child,
  });

  static IconsChemaProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<IconsChemaProvider>();

  @override
  bool updateShouldNotify(covariant IconsChemaProvider oldWidget) {
    return true;
  }
}

class IconsChema {
  bool elementsView;

  IconsChema({
    required this.elementsView,
  });

  changeElementsView(bool newValue) {
    elementsView = newValue;
  }
}
