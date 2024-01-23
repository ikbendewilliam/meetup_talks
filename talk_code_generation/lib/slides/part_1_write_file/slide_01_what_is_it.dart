import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_lightning_talk_build_runner/theme/themes.dart';
import 'package:meetup_lightning_talk_build_runner/widgets/bullet_list.dart';

class P1S01WhatIsIt extends FlutterDeckSlideWidget {
  const P1S01WhatIsIt()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/101',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      theme: Themes.darkTheme,
      backgroundBuilder: Themes.darkThemeBackgroundBuilder,
      builder: (context) => const BulletList(
        title: 'File().write()',
        items: [
          'Write code to files',
          'Input a String, written literally',
          'High control',
          'Low abstraction & customizability',
          'No validation',
        ],
      ),
    );
  }
}
