import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_lightning_talk_build_runner/theme/themes.dart';

class P0S03Copilot extends FlutterDeckSlideWidget {
  const P0S03Copilot()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/003',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.image(
      theme: Themes.lightTheme,
      imageBuilder: (context) => Image.asset(
        'assets/copilot.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
