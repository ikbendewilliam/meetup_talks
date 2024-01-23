import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_lightning_talk_build_runner/theme/themes.dart';
import 'package:meetup_lightning_talk_build_runner/widgets/bullet_list.dart';

class P3S08Usages extends FlutterDeckSlideWidget {
  const P3S08Usages()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/308',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      theme: Themes.darkTheme,
      backgroundBuilder: Themes.darkThemeBackgroundBuilder,
      builder: (context) => const BulletList(
        title: 'Usages',
        items: [
          'Generate single file from multiple files',
          'Automate big tasks (Dependency injection, navigation, widgetbook, ...)',
        ],
      ),
    );
  }
}
