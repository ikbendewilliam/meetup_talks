import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_lightning_talk_build_runner/theme/themes.dart';

class P1S03ModelGenerator extends FlutterDeckSlideWidget {
  const P1S03ModelGenerator()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/103',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      theme: Themes.darkTheme,
      backgroundBuilder: Themes.darkThemeBackgroundBuilder,
      title: 'package example: model_generator',
    );
  }
}
