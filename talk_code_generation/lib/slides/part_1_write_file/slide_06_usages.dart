import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_lightning_talk_build_runner/theme/themes.dart';
import 'package:meetup_lightning_talk_build_runner/widgets/bullet_list.dart';

class P1S06Usages extends FlutterDeckSlideWidget {
  const P1S06Usages()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/106',
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
          'Generate files once that will be changed',
          'Change existing files',
          'Generate files that don\'t need to regenerate every time build_runner is run',
        ],
      ),
    );
  }
}
