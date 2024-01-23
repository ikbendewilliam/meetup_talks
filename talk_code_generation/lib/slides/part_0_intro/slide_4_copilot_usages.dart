import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_lightning_talk_build_runner/theme/themes.dart';
import 'package:meetup_lightning_talk_build_runner/widgets/bullet_list.dart';

class P0S04CopilotUsages extends FlutterDeckSlideWidget {
  const P0S04CopilotUsages()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/004',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      theme: Themes.lightTheme,
      builder: (context) => const BulletList(
        lightTheme: true,
        title: 'Copilot usages',
        items: [
          'During development',
          'Writing Widgets, Documentation, Logic, ...',
          'Short to medium code',
        ],
      ),
    );
  }
}
