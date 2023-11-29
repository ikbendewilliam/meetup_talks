import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class BuildRunnerTip3Slide extends FlutterDeckSlideWidget {
  const BuildRunnerTip3Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/build-runner-tip-3',
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      theme: FlutterDeckThemeData.fromThemeAndText(
        ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
            background: const Color(0xFF012547),
            seedColor: const Color(0xFF012547),
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
        ),
        const FlutterDeckTextTheme().apply(
          color: Colors.white,
        ),
      ),
      builder: (context) => const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '- Update build_resolvers to ^2.3.0 (small increase)',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            Text(
              '- Keep build files for different build config',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            Text(
              '   (can run separate, but all plugins need to be updated or build_runner needs to be updated)',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              '- Buy an M1/M2 (x2 faster)',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            Text(
              '- Wait for macros (?? faster)',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            Text(
              '     https://github.com/dart-lang/language/blob/main/working/macros/feature-specification.md',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
