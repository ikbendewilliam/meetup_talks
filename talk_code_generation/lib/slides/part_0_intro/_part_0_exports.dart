import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_lightning_talk_build_runner/slides/part_0_intro/slide_0_title.dart';
import 'package:meetup_lightning_talk_build_runner/slides/part_0_intro/slide_1_william.dart';
import 'package:meetup_lightning_talk_build_runner/slides/part_0_intro/slide_2_types_of_generation.dart';
import 'package:meetup_lightning_talk_build_runner/slides/part_0_intro/slide_3_copilot.dart';
import 'package:meetup_lightning_talk_build_runner/slides/part_0_intro/slide_4_copilot_usages.dart';

List<FlutterDeckSlideWidget> slidesPart0 = [
  const P0S00Title(),
  const P0S01William(),
  const P0S02TypesOfGeneration(),
  const P0S03Copilot(),
  const P0S04CopilotUsages(),
];
