import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_lightning_talk_build_runner/theme/themes.dart';

class P1S02Example extends FlutterDeckSlideWidget {
  const P1S02Example()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/102',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.split(
      leftBuilder: (context) => Theme(
        data: ThemeData.dark(),
        child: const FlutterDeckCodeHighlight(
          fileName: 'script.dart',
          code: '''final file = File('result.dart');
final content = """class Example {
  static printHelloWorld() => print('hello world');
}
""";
file.writeAsStringSync(content);''',
        ),
      ),
      rightBuilder: (context) => Theme(
        data: ThemeData.dark(),
        child: const FlutterDeckCodeHighlight(
          fileName: 'result.dart',
          code: """class Example {
  static printHelloWorld() => print('hello world');
}
""",
        ),
      ),
      backgroundBuilder: Themes.darkThemeBackgroundBuilder,
      theme: Themes.darkTheme,
    );
  }
}
