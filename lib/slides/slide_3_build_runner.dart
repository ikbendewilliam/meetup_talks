import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class BuildRunnerTimeSlide extends FlutterDeckSlideWidget {
  const BuildRunnerTimeSlide()
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/build-runner',
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
        child: Text(
          'Succeeded after 7m 23s',
          style: TextStyle(
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
