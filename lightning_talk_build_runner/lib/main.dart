import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_lightning_talk_build_runner/slides/slide_0_title.dart';
import 'package:meetup_lightning_talk_build_runner/slides/slide_1_shader.dart';
import 'package:meetup_lightning_talk_build_runner/slides/slide_2_shader_code.dart';
import 'package:meetup_lightning_talk_build_runner/slides/slide_3_build_runner.dart';
import 'package:meetup_lightning_talk_build_runner/slides/slide_4_build_runner_tip_1.dart';
import 'package:meetup_lightning_talk_build_runner/slides/slide_5_build_runner_tip_2.dart';
import 'package:meetup_lightning_talk_build_runner/slides/slide_6_build_runner_tip_3.dart';
import 'package:meetup_lightning_talk_build_runner/slides/slide_99_last.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterDeckApp(
      configuration: const FlutterDeckConfiguration(
        transition: FlutterDeckTransition.slide(),
        controls: FlutterDeckControlsConfiguration(
          nextKey: LogicalKeyboardKey.arrowRight,
          previousKey: LogicalKeyboardKey.arrowLeft,
          openDrawerKey: LogicalKeyboardKey.period,
        ),
        footer: FlutterDeckFooterConfiguration(
          showSlideNumbers: true,
          showSocialHandle: true,
        ),
        header: FlutterDeckHeaderConfiguration(
          showHeader: false,
        ),
        showProgress: false,
      ),
      slides: [
        TitleSlide(),
        const ShaderSlide(),
        const ShaderCodeSlide(),
        const BuildRunnerTimeSlide(),
        const BuildRunnerTip1Slide(),
        const BuildRunnerTip2Slide(),
        const BuildRunnerTip3Slide(),
        const LastSlide(),
      ],
      lightTheme: FlutterDeckThemeData.fromThemeAndText(
        ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF012547),
            background: Colors.white,
          ),
          useMaterial3: true,
        ),
        const FlutterDeckTextTheme().apply(
          color: const Color(0xFF012547),
        ),
      ),
      darkTheme: FlutterDeckThemeData.fromThemeAndText(
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
      themeMode: ThemeMode.light,
      speakerInfo: const FlutterDeckSpeakerInfo(
        name: 'William Verhaeghe',
        description: 'Flutter developer at icapps',
        socialHandle: '',
        imagePath: 'assets/me.jpg',
      ),
    );
  }
}
