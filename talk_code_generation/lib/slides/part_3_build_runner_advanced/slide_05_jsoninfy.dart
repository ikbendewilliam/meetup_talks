import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_lightning_talk_build_runner/theme/themes.dart';

class P3S05Jsonify extends FlutterDeckSlideWidget {
  const P3S05Jsonify()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/305',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      theme: Themes.darkTheme,
      backgroundBuilder: Themes.darkThemeBackgroundBuilder,
      title: 'Put it in a json',
    );
  }
}
