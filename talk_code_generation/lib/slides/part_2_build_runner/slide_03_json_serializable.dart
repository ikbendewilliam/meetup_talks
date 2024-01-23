import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_lightning_talk_build_runner/theme/themes.dart';

class P2S03JsonSerializable extends FlutterDeckSlideWidget {
  const P2S03JsonSerializable()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/203',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      theme: Themes.lightTheme,
      title: 'package example: json_serializable',
    );
  }
}
