import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class BuildRunnerTip2Slide extends FlutterDeckSlideWidget {
  const BuildRunnerTip2Slide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/build-runner-tip-2',
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
            code: '''
targets:
  \$default:
    builders:
  injectable_generator:injectable_config_builder:
    generate_for:
      include:
        - lib/di/injectable.dart
        - test/di/test_injectable.dart
  drift_dev:
    generate_for:
      include:
        - lib/database/**.dart
      ''',
            fileName: 'build.yaml',
            language: 'yaml',
          ),
        ),
      ),
    );
  }
}
