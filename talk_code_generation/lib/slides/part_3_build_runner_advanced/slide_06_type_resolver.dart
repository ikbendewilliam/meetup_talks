import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_lightning_talk_build_runner/theme/themes.dart';
import 'package:meetup_lightning_talk_build_runner/widgets/bullet_list.dart';

class P3S06TypeResolve extends FlutterDeckSlideWidget {
  const P3S06TypeResolve()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/306',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.split(
      theme: Themes.darkTheme,
      backgroundBuilder: Themes.darkThemeBackgroundBuilder,
      leftBuilder: (context) => const BulletList(
        title: 'Type resolver',
        items: [
          'Slighly stolen from injectable',
          'Resolves types',
          'Imports correct files',
        ],
      ),
      rightBuilder: (context) => Theme(
        data: ThemeData.dark(),
        child: const FlutterDeckCodeHighlight(
          fileName: 'builder.dart',
          code: """...
  ..returns = typeRefer(
  route.returnType,
  forceNullable: true,
  forceFuture: isAsync,
)""",
        ),
      ),
    );
  }
}
