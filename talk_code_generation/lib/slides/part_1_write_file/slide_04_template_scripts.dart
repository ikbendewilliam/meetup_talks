import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_lightning_talk_build_runner/theme/themes.dart';

class P1S04TemplateScripts extends FlutterDeckSlideWidget {
  const P1S04TemplateScripts()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/104',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.bigFact(
      theme: Themes.darkTheme,
      backgroundBuilder: Themes.darkThemeBackgroundBuilder,
      title: 'package example: template_scripts',
    );
  }
}
