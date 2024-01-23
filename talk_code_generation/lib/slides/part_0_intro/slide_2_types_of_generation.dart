import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_lightning_talk_build_runner/theme/themes.dart';
import 'package:meetup_lightning_talk_build_runner/widgets/bullet_list.dart';

class P0S02TypesOfGeneration extends FlutterDeckSlideWidget {
  const P0S02TypesOfGeneration()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/002',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      theme: Themes.lightTheme,
      builder: (context) => const Center(
        child: BulletList(
          lightTheme: true,
          title: 'Types of generation',
          items: [
            'Copilot',
            'File().write()',
            'build_runner',
            'build_runner (Advanced)',
          ],
        ),
      ),
    );
  }
}
