import 'package:flutter_deck/flutter_deck.dart';
import 'package:meetup_lightning_talk_build_runner/slides/part_1_write_file/slide_00_title.dart';
import 'package:meetup_lightning_talk_build_runner/slides/part_1_write_file/slide_01_what_is_it.dart';
import 'package:meetup_lightning_talk_build_runner/slides/part_1_write_file/slide_02_example.dart';
import 'package:meetup_lightning_talk_build_runner/slides/part_1_write_file/slide_03_model_generator.dart';
import 'package:meetup_lightning_talk_build_runner/slides/part_1_write_file/slide_04_template_scripts.dart';
import 'package:meetup_lightning_talk_build_runner/slides/part_1_write_file/slide_05_fgen.dart';
import 'package:meetup_lightning_talk_build_runner/slides/part_1_write_file/slide_06_usages.dart';
import 'package:meetup_lightning_talk_build_runner/slides/part_1_write_file/slide_07_demo.dart';

List<FlutterDeckSlideWidget> slidesPart1 = [
  const P1S00Title(),
  const P1S01WhatIsIt(),
  const P1S02Example(),
  const P1S03ModelGenerator(),
  const P1S04TemplateScripts(),
  const P1S05FGen(),
  const P1S06Usages(),
  const P1S07Demo(),
];
