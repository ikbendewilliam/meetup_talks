import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_lightning_talk_build_runner/theme/themes.dart';

class P3S00Title extends FlutterDeckSlideWidget {
  const P3S00Title()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/300',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      title: 'build_runner multiple files',
      theme: Themes.darkTheme,
      backgroundBuilder: Themes.darkThemeBackgroundBuilder,
    );
  }
}
