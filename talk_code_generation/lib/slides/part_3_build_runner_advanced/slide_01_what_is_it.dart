import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_lightning_talk_build_runner/theme/themes.dart';

class P3S01WhatIsIt extends FlutterDeckSlideWidget {
  const P3S01WhatIsIt()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/301',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.image(
      theme: Themes.darkTheme,
      backgroundBuilder: Themes.darkThemeBackgroundBuilder,
      imageBuilder: (context) => Image.asset(
        'assets/build_runner_multiple_files.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
