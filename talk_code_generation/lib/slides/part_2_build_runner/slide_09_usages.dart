import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_lightning_talk_build_runner/theme/themes.dart';
import 'package:meetup_lightning_talk_build_runner/widgets/bullet_list.dart';

class P2S09Usages extends FlutterDeckSlideWidget {
  const P2S09Usages()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/209',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      theme: Themes.lightTheme,
      builder: (context) => const BulletList(
        lightTheme: true,
        title: 'Usages',
        items: [
          'Generate files that never change manually',
          'Extend existing code',
          'Generate files that need to regenerate regularly',
        ],
      ),
    );
  }
}
