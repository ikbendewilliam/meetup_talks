import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class BuildRunnerTip1Slide extends FlutterDeckSlideWidget {
  const BuildRunnerTip1Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/build-runner-tip-1',
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
      builder: (context) => Center(
        child: Theme(
          data: ThemeData.dark(),
          child: const FlutterDeckCodeHighlight(
            code: '''// screens.dart

export 'screens/screen_1.dart';
export 'screens/screen_2.dart';
export 'screens/screen_3.dart';

// foo.dart

import 'screens.dart';''',
            fileName: 'lazy_importing.dart',
            language: 'dart',
          ),
        ),
      ),
    );
  }
}
