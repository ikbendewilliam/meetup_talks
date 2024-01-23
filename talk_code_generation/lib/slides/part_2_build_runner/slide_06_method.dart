import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_lightning_talk_build_runner/theme/themes.dart';
import 'package:meetup_lightning_talk_build_runner/widgets/bullet_list.dart';

class P2S06Method extends FlutterDeckSlideWidget {
  const P2S06Method()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/206',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.split(
      theme: Themes.lightTheme,
      leftBuilder: (context) => const BulletList(
        lightTheme: true,
        title: 'Method()',
        items: [
          'Creates a class',
          'Specify name, return type, body, etc.',
        ],
      ),
      rightBuilder: (context) => Theme(
        data: ThemeData.light(),
        child: const FlutterDeckCodeHighlight(
          fileName: 'class.dart',
          code: """Method(
  (b) => b
    ..name = 'goBack'
    ..lambda = true
    ..returns = const Reference('void')
    ..body =
        const Reference('navigatorKey.currentState?.pop').call([]).code,
),
""",
        ),
      ),
    );
  }
}
