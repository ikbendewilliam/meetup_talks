import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_lightning_talk_build_runner/theme/themes.dart';

class P1S05FGen extends FlutterDeckSlideWidget {
  const P1S05FGen()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/105',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      theme: Themes.darkTheme,
      backgroundBuilder: Themes.darkThemeBackgroundBuilder,
      title: 'package example: fgen',
    );
  }
}
