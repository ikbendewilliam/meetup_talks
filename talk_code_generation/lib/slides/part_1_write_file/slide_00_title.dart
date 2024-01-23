import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_lightning_talk_build_runner/theme/themes.dart';

class P1S00Title extends FlutterDeckSlideWidget {
  const P1S00Title()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/100',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      title: 'File().write()',
      theme: Themes.darkTheme,
      backgroundBuilder: Themes.darkThemeBackgroundBuilder,
    );
  }
}
