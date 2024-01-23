import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_lightning_talk_build_runner/theme/themes.dart';
import 'package:meetup_lightning_talk_build_runner/widgets/bullet_list.dart';

class P2S01WhatIsIt extends FlutterDeckSlideWidget {
  const P2S01WhatIsIt()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/201',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      theme: Themes.lightTheme,
      builder: (context) => const BulletList(
        lightTheme: true,
        title: 'build_runner',
        items: [
          'Generate files',
          'Use annotations',
          'Receive details about classes/code',
          'Using classes to generate code',
        ],
      ),
    );
  }
}
