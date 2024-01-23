import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_lightning_talk_build_runner/theme/themes.dart';

class P1S07Demo extends FlutterDeckSlideWidget {
  const P1S07Demo()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/107',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      theme: Themes.darkTheme,
      backgroundBuilder: Themes.darkThemeBackgroundBuilder,
      title: 'DEMO',
    );
  }
}
