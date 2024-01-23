import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_lightning_talk_build_runner/theme/themes.dart';

class P2S10Demo extends FlutterDeckSlideWidget {
  const P2S10Demo()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/210',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      theme: Themes.lightTheme,
      title: 'DEMO',
    );
  }
}
