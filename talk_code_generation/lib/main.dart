import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_lightning_talk_build_runner/slides/part_0_intro/_part_0_exports.dart';
import 'package:meetup_lightning_talk_build_runner/slides/part_1_write_file/_part_1_exports.dart';
import 'package:meetup_lightning_talk_build_runner/slides/part_2_build_runner/_part_2_exports.dart';
import 'package:meetup_lightning_talk_build_runner/slides/part_3_build_runner_advanced/_part_3_exports.dart';
import 'package:meetup_lightning_talk_build_runner/slides/part_4_outro/_part_4_exports.dart';
import 'package:meetup_lightning_talk_build_runner/theme/themes.dart';

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
          presenterToolbarVisible: false,
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
        ...slidesPart0,
        ...slidesPart1,
        ...slidesPart2,
        ...slidesPart3,
        ...slidesPart4,
      ],
      lightTheme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: ThemeMode.light,
      speakerInfo: const FlutterDeckSpeakerInfo(
        name: 'William Verhaeghe',
        description: 'Flutter lead at icapps',
        socialHandle: '',
        imagePath: 'assets/me.png',
      ),
    );
  }
}
