import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_lightning_talk_build_runner/theme/themes.dart';

class P3S03FlutterNavigationGenerator extends FlutterDeckSlideWidget {
  const P3S03FlutterNavigationGenerator()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/303',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      theme: Themes.darkTheme,
      backgroundBuilder: Themes.darkThemeBackgroundBuilder,
      title: 'package example: flutter_navigation_generator',
    );
  }
}
