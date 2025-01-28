import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:lightning_talk_flutter_crazy_fortune_wheel/slides/slide_0_title.dart';
import 'package:lightning_talk_flutter_crazy_fortune_wheel/slides/slide_1_goal.dart';
import 'package:lightning_talk_flutter_crazy_fortune_wheel/slides/slide_2_frame.dart';
import 'package:lightning_talk_flutter_crazy_fortune_wheel/slides/slide_3_segment_clipper.dart';
import 'package:lightning_talk_flutter_crazy_fortune_wheel/slides/slide_4_flipper.dart';
import 'package:lightning_talk_flutter_crazy_fortune_wheel/slides/slide_5_center.dart';
import 'package:lightning_talk_flutter_crazy_fortune_wheel/slides/slide_6_rotation.dart';
import 'package:lightning_talk_flutter_crazy_fortune_wheel/slides/slide_7_shader.dart';
import 'package:lightning_talk_flutter_crazy_fortune_wheel/slides/slide_99_last.dart';

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
        const GoalSlide(),
        const FrameSlide(),
        const SegmentsClipperSlide(),
        const FlipperSlide(),
        const CenterSlide(),
        const RotationSlide(),
        const ShaderSlide(),
        LastSlide(),
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
