import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_lightning_talk_build_runner/theme/themes.dart';

class P2S00Title extends FlutterDeckSlideWidget {
  const P2S00Title()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/200',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      title: 'build_runner',
      theme: Themes.lightTheme,
    );
  }
}
